import 'package:flutter_test/flutter_test.dart';
import 'package:infinit_list/posts/domain/business_logic_bloc/post_bloc.dart';

void main() {
  group('PostEvent', () {
    group('PostFetch', () {
      test('support value comparison', () {
        expect(PostFetched(), PostFetched());
      });
    });
  });
}
