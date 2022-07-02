import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:infinit_list/core/error/exception.dart';
import 'package:infinit_list/posts/domain/business_logic_bloc/post_bloc.dart';
import 'package:infinit_list/posts/domain/models/post.dart';
import 'package:infinit_list/posts/domain/repository.dart';
import 'package:mocktail/mocktail.dart';

class MockPostRepository extends Mock implements PostRepository {}

void main() {
  group('PostBloc', () {
    const mockPosts = [Post(id: 1, title: 'post title', body: 'post body')];
    const extraMockPosts = [
      Post(id: 2, title: 'post title', body: 'post body')
    ];
    late MockPostRepository mockPostRepository;
    late PostBloc sut;
    setUp(() {
      mockPostRepository = MockPostRepository();
      sut = PostBloc(mockPostRepository);
    });

    test('initial state is PostState', () {
      expect(sut.state, const PostState());
    });
    group('PostFetched', () {
      blocTest<PostBloc, PostState>(
        'emits nothing when posts has reached maximum amount',
        build: () => sut,
        seed: () => const PostState(hasReachedMax: true),
        act: (bloc) => bloc.add(PostFetched()),
        expect: () => <PostState>[],
      );

      blocTest<PostBloc, PostState>(
          'emits successful status when repository fetches initial posts',
          setUp: () {
            when(() => mockPostRepository.fetchPosts())
                .thenAnswer((_) async => mockPosts);
          },
          build: () => sut,
          act: (bloc) {
            bloc.add(PostFetched());
          },
          expect: () => <PostState>[
                const PostState(
                    postStatus: PostStatus.success,
                    posts: mockPosts,
                    hasReachedMax: false),
              ],
          verify: (_) {
            verify(() => mockPostRepository.fetchPosts()).called(1);
          });

      blocTest<PostBloc, PostState>(
          'drops new events when processing current event',
          setUp: () {
            when(() => mockPostRepository.fetchPosts())
                .thenAnswer((_) async => mockPosts);
          },
          build: () => sut,
          act: (bloc) {
            bloc
              ..add(PostFetched())
              ..add(PostFetched());
          },
          expect: () => <PostState>[
                const PostState(
                  postStatus: PostStatus.success,
                  posts: mockPosts,
                  hasReachedMax: false,
                )
              ],
          verify: (_) {
            verify(() => mockPostRepository.fetchPosts()).called(1);
          });

      blocTest<PostBloc, PostState>('throttles events',
          setUp: () {
            when(() => mockPostRepository.fetchPosts())
                .thenAnswer((_) async => mockPosts);
          },
          build: () => sut,
          act: (bloc) async {
            bloc.add(PostFetched());
            await Future<void>.delayed(Duration.zero);
            bloc.add(PostFetched());
          },
          expect: () => <PostState>[
                const PostState(
                  postStatus: PostStatus.success,
                  posts: mockPosts,
                  hasReachedMax: false,
                )
              ],
          verify: (_) {
            verify(() => mockPostRepository.fetchPosts()).called(1);
          });

      blocTest<PostBloc, PostState>(
          'emits failure status when http fetches posts and throw exception',
          build: () => sut,
          setUp: () {
            when(() => mockPostRepository.fetchPosts())
                .thenThrow(ServerException());
          },
          act: (bloc) {
            bloc.add(PostFetched());
          },
          expect: () => <PostState>[
                const PostState(
                  postStatus: PostStatus.failure,
                )
              ],
          verify: (_) {
            verify(() => mockPostRepository.fetchPosts()).called(1);
          });
    });
  });
}
