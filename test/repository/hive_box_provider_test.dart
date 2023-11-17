import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:word_quiz/repository/hive_box_provider.dart';

import '../mock/hive_tester.dart';

void main() {
  setUp(setUpHive);

  tearDown(tearDownHive);

  test('test', () async {
    final container = ProviderContainer();
    final box = await container.read(hiveBoxProvider('test').future);
    expect(box.isOpen, isTrue);
    expect(box.name, 'test');
  });
}
