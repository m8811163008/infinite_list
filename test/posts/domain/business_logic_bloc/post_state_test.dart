import 'package:flutter_test/flutter_test.dart';
import 'package:infinit_list/posts/domain/business_logic_bloc/post_bloc.dart';

void main() {
  group('PostState', () {
    test('support value comparison', () {
      expect(PostState(), PostState());
      expect(PostState().toString(), PostState().toString());
    });
  });
}
