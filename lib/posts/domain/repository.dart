import 'package:infinit_list/posts/domain/models/post.dart';

abstract class PostRepository {
  Future<List<Post>> fetchPosts({int startIndex = 0, int limit = 20});
}
