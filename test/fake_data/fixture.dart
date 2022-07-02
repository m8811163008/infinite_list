import 'dart:io';

String fixture(String name) {
  return File('test/fake_data/$name').readAsStringSync();
}
