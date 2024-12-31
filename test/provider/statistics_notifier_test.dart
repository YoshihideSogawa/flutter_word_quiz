import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/quiz_statistics.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/provider/statistics_notifier.dart';

import '../mock/mock_box_data.dart';

void main() {
  test('初期値が保存されていない場合', () async {
    const quizType = QuizTypes.daily;

    final container = ProviderContainer(
      overrides: [
        quizOverride(quizType: quizType),
      ],
    );

    final statistics =
        await container.read(statisticsNotifierProvider(quizType).future);
    expect(statistics.clearCount, 0);
    expect(statistics.currentChain, 0);
    expect(statistics.lastChain, 0);
    expect(statistics.maxChain, 0);
    expect(statistics.playCount, 0);
  });

  test('初期値が保存されている場合', () async {
    const quizType = QuizTypes.daily;
    const statisticsData = QuizStatistics(
      clearCount: 5,
      currentChain: 5,
      maxChain: 6,
      playCount: 10,
    );

    final container = ProviderContainer(
      overrides: [
        quizOverride(quizType: quizType, statistics: statisticsData),
      ],
    );

    final statistics =
        await container.read(statisticsNotifierProvider(quizType).future);
    expect(statistics.clearCount, 5);
    expect(statistics.currentChain, 5);
    expect(statistics.lastChain, 0);
    expect(statistics.maxChain, 6);
    expect(statistics.playCount, 10);
  });

  test('startQuiz', () async {
    const quizType = QuizTypes.daily;
    const statisticsData = QuizStatistics(
      clearCount: 5,
      currentChain: 5,
      maxChain: 6,
      playCount: 10,
    );

    final container = ProviderContainer(
      overrides: [
        quizOverride(quizType: quizType, statistics: statisticsData),
      ],
    );

    await container
        .read(statisticsNotifierProvider(quizType).notifier)
        .startQuiz();
    final statistics =
        await container.read(statisticsNotifierProvider(quizType).future);
    expect(statistics.clearCount, 5);
    expect(statistics.currentChain, 0);
    expect(statistics.lastChain, 0);
    expect(statistics.maxChain, 6);
    expect(statistics.playCount, 11);
  });

  test('nextQuiz', () async {
    const quizType = QuizTypes.daily;
    const statisticsData = QuizStatistics(
      clearCount: 1,
      currentChain: 5,
      maxChain: 5,
      playCount: 10,
    );

    final container = ProviderContainer(
      overrides: [
        quizOverride(quizType: quizType, statistics: statisticsData),
      ],
    );

    await container
        .read(statisticsNotifierProvider(quizType).notifier)
        .nextQuiz();
    final statistics =
        await container.read(statisticsNotifierProvider(quizType).future);
    expect(statistics.clearCount, 1);
    expect(statistics.currentChain, 5);
    expect(statistics.lastChain, 0);
    expect(statistics.maxChain, 5);
    expect(statistics.playCount, 11);
  });

  test('successQuiz', () async {
    const quizType = QuizTypes.daily;
    const statisticsData = QuizStatistics(
      clearCount: 1,
      currentChain: 5,
      maxChain: 5,
      playCount: 10,
    );

    final container = ProviderContainer(
      overrides: [
        quizOverride(quizType: quizType, statistics: statisticsData),
      ],
    );

    await container
        .read(statisticsNotifierProvider(quizType).notifier)
        .successQuiz();
    final statistics =
        await container.read(statisticsNotifierProvider(quizType).future);
    expect(statistics.clearCount, 2);
    expect(statistics.currentChain, 6);
    expect(statistics.lastChain, 0);
    expect(statistics.maxChain, 6);
    expect(statistics.playCount, 10);
  });

  test('finishQuiz', () async {
    const quizType = QuizTypes.daily;
    const statisticsData = QuizStatistics(
      clearCount: 1,
      currentChain: 5,
      maxChain: 5,
      playCount: 10,
    );

    final container = ProviderContainer(
      overrides: [
        quizOverride(quizType: quizType, statistics: statisticsData),
      ],
    );

    await container
        .read(statisticsNotifierProvider(quizType).notifier)
        .finishQuiz();
    final statistics =
        await container.read(statisticsNotifierProvider(quizType).future);
    expect(statistics.clearCount, 1);
    expect(statistics.currentChain, 0);
    expect(statistics.lastChain, 5);
    expect(statistics.maxChain, 5);
    expect(statistics.playCount, 10);
  });
}
