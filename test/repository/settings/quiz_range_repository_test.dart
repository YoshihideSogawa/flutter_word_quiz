import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:word_quiz/model/monster_series.dart';
import 'package:word_quiz/repository/settings/quiz_range_repository.dart';

import '../../mock/mock_box_data.dart';

void main() {
  test('問題範囲が保存されていない場合', () async {
    final container = ProviderContainer(
      overrides: [
        settingsOverride(),
      ],
    );

    final settingsQuizRange =
        await container.read(quizRangeRepositoryProvider.future);
    expect(settingsQuizRange, diamondPearl);
  });

  test('問題範囲が保存されている場合', () async {
    final container = ProviderContainer(
      overrides: [
        settingsOverride(quizRange: blackWhite),
      ],
    );

    final quizRange = await container.read(quizRangeRepositoryProvider.future);
    expect(quizRange, blackWhite);
  });

  test('updateQuizRange', () async {
    final container = ProviderContainer(
      overrides: [
        settingsOverride(quizRange: blackWhite),
      ],
    );

    await container
        .read(quizRangeRepositoryProvider.notifier)
        .updateQuizRange(goldSilver);

    final quizRange = await container.read(quizRangeRepositoryProvider.future);
    expect(quizRange, goldSilver);
  });
}
