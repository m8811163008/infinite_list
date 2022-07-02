import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:infinit_list/posts/domain/models/post.dart';

abstract class PostDataProvider {
  Future<List<Post>> fetchPosts(
      {required int startIndex, required int postLimit});
}

class PostDataProviderImp implements PostDataProvider {
  http.Client client;

  PostDataProviderImp(this.client);

  @override
  Future<List<Post>> fetchPosts(
      {required int startIndex, required int postLimit}) async {
    final http.Response response = await client.get(
      Uri.https(
        'jsonplaceholder.typicode.com',
        '/posts',
        <String, String>{'_start': '$startIndex', '_limit': '$postLimit'},
      ),
    );
    if (response.statusCode == 200) {
      final body = json.decode(response.body) as List;
      return body.map((dynamic json) {
        return Post(
            id: json['id'] as int,
            title: json['title'] as String,
            body: json['body'] as String);
      }).toList();
    }
    throw Exception('error fetching posts');
  }
}
