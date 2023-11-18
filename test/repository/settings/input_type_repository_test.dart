import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:word_quiz/constant/box_names.dart';
import 'package:word_quiz/model/settings_input_type.dart';
import 'package:word_quiz/repository/hive_box_provider.dart';
import 'package:word_quiz/repository/settings/input_type_repository.dart';
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

    final inputType = await container.read(inputTypeRepositoryProvider.future);
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

    final inputType = await container.read(inputTypeRepositoryProvider.future);
    expect(inputType, InputTypes.all);
  });

  test('入力タイプの更新', () async {
    final box = MockHiveBox(
      initData: {inputTypeKey: InputTypes.all.typeId},
    );

    final container = ProviderContainer(
      overrides: [
        hiveBoxProvider(settingsBoxName).overrideWith((ref) => box),
      ],
    );

    await container
        .read(inputTypeRepositoryProvider.notifier)
        .updateInputType(InputTypes.switching);
    expect(box.data[inputTypeKey], InputTypes.switching.typeId);
  });
}
