part of 'post_bloc.dart';

enum PostStatus { initial, success, failure }

class PostState extends Equatable {
  final PostStatus postStatus;
  final bool hasReachedMax;
  final List<Post> posts;

  const PostState(
      {this.postStatus = PostStatus.initial,
      this.hasReachedMax = false,
      this.posts = const <Post>[]});

  PostState copyWith({
    PostStatus? postStatus,
    bool? hasReachedMax,
    List<Post>? posts,
  }) {
    return PostState(
      postStatus: postStatus ?? this.postStatus,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      posts: posts ?? this.posts,
    );
  }

  @override
  String toString() {
    return 'PostState{postStatus: $postStatus, hasReachedMax: $hasReachedMax, posts: $posts}';
  }

  @override
  List<Object> get props => [postStatus, hasReachedMax, posts];
}
