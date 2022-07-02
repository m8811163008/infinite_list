import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:infinit_list/posts/domain/models/post.dart';
import 'package:infinit_list/posts/domain/repository.dart';
import 'package:stream_transform/stream_transform.dart';

part 'post_event.dart';
part 'post_state.dart';

const _postLimit = 20;
const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository;

  PostBloc(this.postRepository) : super(const PostState()) {
    on<PostFetched>(
      _onPostFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  void _onPostFetched(PostFetched event, Emitter<PostState> emit) async {
    if (state.hasReachedMax) return;
    final List<Post> posts = await postRepository.fetchPosts();
    emit(state.copyWith(
        posts: posts, postStatus: PostStatus.success, hasReachedMax: false));
  }
}
