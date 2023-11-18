import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:word_quiz/constant/box_names.dart';
import 'package:word_quiz/model/settings_input_type.dart';
import 'package:word_quiz/repository/hive_box_provider.dart';
import 'package:word_quiz/repository/settings/fetch_input_type.dart';
import 'package:word_quiz/repository/settings/settings_keys.dart';

import '../../mock/mock_hive_box.dart';

void main() {
  test('入力タイプが保存されていない場合', () async {
    final box = MockHiveBox(
      initData: {
        inputTypeKey: null,
      },
    );

    final container = ProviderContainer(
      overrides: [
        hiveBoxProvider(settingsBoxName).overrideWith((ref) => box),
      ],
    );

    final inputType = await container.read(fetchInputTypeProvider.future);
    expect(inputType, InputTypes.switching);
  });

  test('入力値が保存されている場合', () async {
    final box = MockHiveBox(
      initData: {
        inputTypeKey: InputTypes.all.typeId,
      },
    );

    final container = ProviderContainer(
      overrides: [
        hiveBoxProvider(settingsBoxName).overrideWith((ref) => box),
      ],
    );

    final inputType = await container.read(fetchInputTypeProvider.future);
    expect(inputType, InputTypes.all);
  });
}
