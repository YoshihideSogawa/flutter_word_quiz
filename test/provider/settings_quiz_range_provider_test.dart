import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:word_quiz/model/monster_series.dart';
import 'package:word_quiz/provider/settings_quiz_range_provider.dart';
import 'package:word_quiz/repository/settings_repository.dart';

import '../mock/generate_mocks.mocks.dart';

void main() {
  test('問題範囲が保存されていない場合', () {
    final mockSettingsRepository = MockSettingsRepository();
    when(mockSettingsRepository.quizRangeId()).thenReturn(null);

    final container = ProviderContainer(
      overrides: [
        settingsRepositoryProvider.overrideWithValue(mockSettingsRepository),
      ],
    );

    final settingsQuizRange = container.read(settingsQuizRangeProvider);
    expect(settingsQuizRange, diamondPearl);
  });

  test('問題範囲が保存されている場合', () {
    final mockSettingsRepository = MockSettingsRepository();
    when(mockSettingsRepository.quizRangeId()).thenReturn(blackWhite.id);

    final container = ProviderContainer(
      overrides: [
        settingsRepositoryProvider.overrideWithValue(mockSettingsRepository),
      ],
    );

    final settingsQuizRange = container.read(settingsQuizRangeProvider);
    expect(settingsQuizRange, blackWhite);
  });

  test('updateQuizRange', () {
    final mockSettingsRepository = MockSettingsRepository();
    when(mockSettingsRepository.quizRangeId()).thenReturn(blackWhite.id);

    final container = ProviderContainer(
      overrides: [
        settingsRepositoryProvider.overrideWithValue(mockSettingsRepository),
      ],
    );

    container
        .read(settingsQuizRangeProvider.notifier)
        .updateQuizRange(goldSilver);

    final settingsQuizRange = container.read(settingsQuizRangeProvider);
    expect(settingsQuizRange, goldSilver);
  });
}
