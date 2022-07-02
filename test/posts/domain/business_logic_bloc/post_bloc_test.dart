import 'package:flutter_test/flutter_test.dart';
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
  });
}
