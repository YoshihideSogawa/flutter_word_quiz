import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:word_quiz/model/settings_input_type.dart';
import 'package:word_quiz/repository/settings/input_type_repository.dart';
import 'package:word_quiz/repository/settings/settings_keys.dart';

import '../../mock/mock_box_data.dart';

void main() {
  test('入力タイプが保存されていない場合', () async {
    final container = ProviderContainer(
      overrides: [
        settingsOverride(),
      ],
    );

    final inputType = await container.read(inputTypeRepositoryProvider.future);
    expect(inputType, InputTypes.switching);
  });

  test('入力値が保存されている場合', () async {
    final container = ProviderContainer(
      overrides: [
        settingsOverride(inputType: InputTypes.all),
      ],
    );

    final inputType = await container.read(inputTypeRepositoryProvider.future);
    expect(inputType, InputTypes.all);
  });

  test('入力タイプの更新', () async {
    final settings = settingsOverrideAndBox(inputType: InputTypes.all);

    final container = ProviderContainer(
      overrides: [
        settings.override,
      ],
    );

    await container
        .read(inputTypeRepositoryProvider.notifier)
        .updateInputType(InputTypes.switching);
    expect(settings.box.data[inputTypeKey], InputTypes.switching.typeId);
  });
}
