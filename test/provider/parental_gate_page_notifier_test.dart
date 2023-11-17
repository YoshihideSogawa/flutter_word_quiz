import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/constant/box_names.dart';
import 'package:word_quiz/provider/parental_gate_page_notifier.dart';
import 'package:word_quiz/repository/app_property/app_property_keys.dart';
import 'package:word_quiz/repository/hive_box_provider.dart';

import '../mock/mock_hive_box.dart';

void main() {
  test('updateParentalControl', () async {
    final box = MockHiveBox<dynamic>();

    final container = ProviderContainer(
      overrides: [
        hiveBoxProvider(appPropertyBoxName).overrideWith((provider) => box),
      ],
    );

    await container
        .read(parentalGatePageNotifierProvider.notifier)
        .updateParentalControl(parentalControl: true);

    expect(box.get(parentalControlKey), isTrue);
  });
}
