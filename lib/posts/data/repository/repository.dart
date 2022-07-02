import 'package:infinit_list/posts/data/providers/provider.dart';
import 'package:infinit_list/posts/domain/repository.dart';

import '../../domain/models/post.dart';

class PostRepositoryImp implements PostRepository {
  PostDataProvider postDataProvider;

  PostRepositoryImp(this.postDataProvider);
  @override
  Future<List<Post>> fetchPosts({int startIndex = 0, int limit = 20}) async {
    return await postDataProvider.fetchPosts(
        startIndex: startIndex, postLimit: limit);
  }
}
