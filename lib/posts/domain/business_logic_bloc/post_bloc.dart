import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infinit_list/posts/domain/models/post.dart';
import 'package:infinit_list/posts/domain/repository.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository;

  PostBloc(this.postRepository) : super(const PostState()) {
    on<PostFetched>(_onPostFetched);
  }

  void _onPostFetched(PostFetched event, Emitter<PostState> emit) async {
    if (state.hasReachedMax) return;
    final List<Post> posts = await postRepository.fetchPosts();
    emit(state.copyWith(
        posts: posts, postStatus: PostStatus.success, hasReachedMax: false));
  }
}
