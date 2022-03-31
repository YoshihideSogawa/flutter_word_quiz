import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:word_quiz/model/settings_input_type.dart';
import 'package:word_quiz/provider/settings_input_type_provider.dart';
import 'package:word_quiz/repository/settings_repository.dart';

import '../mock/generate_mocks.mocks.dart';

void main() {
  test('入力タイプが保存されていない場合', () {
    final mockSettingsRepository = MockSettingsRepository();
    when(mockSettingsRepository.inputType()).thenReturn(null);

    final container = ProviderContainer(
      overrides: [
        settingsRepositoryProvider.overrideWithValue(mockSettingsRepository),
      ],
    );

    final settingsInputType = container.read(settingsInputTypeProvider);
    expect(settingsInputType, inputTypeSwitching);
  });

  test('入力値が保存されている場合', () {
    final mockSettingsRepository = MockSettingsRepository();
    when(mockSettingsRepository.inputType()).thenReturn(inputTypeAll);

    final container = ProviderContainer(
      overrides: [
        settingsRepositoryProvider.overrideWithValue(mockSettingsRepository),
      ],
    );

    final settingsInputType = container.read(settingsInputTypeProvider);
    expect(settingsInputType, inputTypeAll);
  });

  test('updateInputType', () {
    final mockSettingsRepository = MockSettingsRepository();
    when(mockSettingsRepository.inputType()).thenReturn(inputTypeAll);

    final container = ProviderContainer(
      overrides: [
        settingsRepositoryProvider.overrideWithValue(mockSettingsRepository),
      ],
    );

    container
        .read(settingsInputTypeProvider.notifier)
        .updateInputType(inputTypeSwitching);

    final settingsInputType = container.read(settingsInputTypeProvider);
    expect(settingsInputType, inputTypeSwitching);
  });
}
