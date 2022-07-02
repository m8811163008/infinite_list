import 'package:flutter_test/flutter_test.dart';
import 'package:infinit_list/posts/domain/models/post.dart';

void main() {
  test('Post.fromJson', () async {
    //arrange
    final post = Post(id: 1, title: 'title', body: 'body');
    Map tPostMap = {'id': 1, 'title': 'title', 'body': 'body'};

    //assert
    expect(post.toJson(), tPostMap);
  });
  test('post from json', () async {
    //arrange
    final post = Post(id: 1, title: 'title', body: 'body');
    Map<String, dynamic> tPostMap = {
      'user_id': 0,
      'id': 1,
      'title': 'title',
      'body': 'body'
    };

    //assert
    expect(Post.fromJson(tPostMap), post);
  });
}
