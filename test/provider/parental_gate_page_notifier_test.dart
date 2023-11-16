import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/constant/box_names.dart';
import 'package:word_quiz/provider/parental_gate_page_notifier.dart';
import 'package:word_quiz/repository/app_property/app_property_keys.dart';

import '../mock/hive_tester.dart';

void main() {
  setUp(setUpHive);

  tearDown(tearDownHive);

  test('updateParentalControl', () async {
    final container = ProviderContainer();
    final box = await putHiveValues(appPropertyBoxName);

    await container
        .read(parentalGatePageNotifierProvider.notifier)
        .updateParentalControl(parentalControl: true);

    expect(box.get(parentalControlKey), isTrue);
  });
}
