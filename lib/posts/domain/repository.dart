import 'package:infinit_list/posts/domain/models/post.dart';

abstract class PostRepository {
  List<Post> fetchPosts();
}
