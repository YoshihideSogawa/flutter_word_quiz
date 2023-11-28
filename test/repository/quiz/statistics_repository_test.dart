import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/quiz_statistics.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/repository/quiz/quiz_data_repository.dart';
import 'package:word_quiz/repository/quiz/statistics_repository.dart';

import '../../mock/mock_box_data.dart';

void main() {
  test('QuizStatistics(save/load)', () async {
    const quizType = QuizTypes.endless;
    final container = ProviderContainer(
      overrides: [
        quizOverride(quizType: quizType),
      ],
    );

    final statisticsRepositoryNotifier =
        container.read(statisticsRepositoryProvider(quizType).notifier);

    const statistics = QuizStatistics(
      clearCount: 10,
      currentChain: 4,
      lastChain: 3,
      maxChain: 5,
      playCount: 10,
    );

    // 保存
    await statisticsRepositoryNotifier.saveStatistics(statistics);

    // 読み込み
    final targetStatistics =
        await container.read(statisticsRepositoryProvider(quizType).future);
    expect(targetStatistics!.clearCount, statistics.clearCount);
    expect(targetStatistics.currentChain, statistics.currentChain);
    expect(targetStatistics.lastChain, statistics.lastChain);
    expect(targetStatistics.maxChain, statistics.maxChain);
    expect(targetStatistics.playCount, statistics.playCount);
  });

  test('deleteAll', () async {
    const quizType = QuizTypes.endless;
    final container = ProviderContainer(
      overrides: [
        quizOverride(quizType: quizType),
      ],
    );
    final statisticsRepositoryNotifier =
        container.read(statisticsRepositoryProvider(quizType).notifier);

    const statistics = QuizStatistics(
      clearCount: 10,
      currentChain: 4,
      lastChain: 3,
      maxChain: 5,
      playCount: 10,
    );

    // 保存
    await statisticsRepositoryNotifier.saveStatistics(statistics);

    // 全削除
    await container
        .read(quizDataRepositoryProvider(quizType).notifier)
        .deleteAll();

    // 読み込み
    final targetStatistics =
        await container.read(statisticsRepositoryProvider(quizType).future);
    expect(targetStatistics, isNull);
  });
}
