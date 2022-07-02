import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PostEvent', () {
    group('PostFetch', () {
      test('support value comparison', () {
        expect(PostFetched(), PostFetched());
      });
    });
  });
}
