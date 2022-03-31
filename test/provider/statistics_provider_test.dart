import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:word_quiz/model/quiz_statistics.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/provider/statistics_provider.dart';
import 'package:word_quiz/repository/quiz_repository.dart';

import '../mock/generate_mocks.mocks.dart';

void main() {
  test('初期値が保存されていない場合', () {
    const quizType = QuizTypes.daily;
    final mockQuizRepository = MockQuizRepository();
    when(mockQuizRepository.loadStatistics()).thenReturn(null);

    final container = ProviderContainer(
      overrides: [
        quizRepositoryProvider(quizType).overrideWithValue(mockQuizRepository),
      ],
    );

    final statistics = container.read(statisticsProvider(quizType));
    expect(statistics.clearCount, 0);
    expect(statistics.currentChain, 0);
    expect(statistics.lastChain, 0);
    expect(statistics.maxChain, 0);
    expect(statistics.playCount, 0);
  });

  test('初期値が保存されている場合', () {
    const quizType = QuizTypes.daily;
    final mockQuizRepository = MockQuizRepository();
    when(mockQuizRepository.loadStatistics()).thenReturn(
      const QuizStatistics(
        clearCount: 5,
        currentChain: 5,
        lastChain: 0,
        maxChain: 6,
        playCount: 10,
      ),
    );

    final container = ProviderContainer(
      overrides: [
        quizRepositoryProvider(quizType).overrideWithValue(mockQuizRepository),
      ],
    );

    final statistics = container.read(statisticsProvider(quizType));
    expect(statistics.clearCount, 5);
    expect(statistics.currentChain, 5);
    expect(statistics.lastChain, 0);
    expect(statistics.maxChain, 6);
    expect(statistics.playCount, 10);
  });

  test('startQuiz', () {
    const quizType = QuizTypes.daily;
    final mockQuizRepository = MockQuizRepository();
    when(mockQuizRepository.loadStatistics()).thenReturn(
      const QuizStatistics(
        clearCount: 5,
        currentChain: 5,
        lastChain: 0,
        maxChain: 6,
        playCount: 10,
      ),
    );

    final container = ProviderContainer(
      overrides: [
        quizRepositoryProvider(quizType).overrideWithValue(mockQuizRepository),
      ],
    );

    container.read(statisticsProvider(quizType).notifier).startQuiz();
    final statistics = container.read(statisticsProvider(quizType));
    expect(statistics.clearCount, 5);
    expect(statistics.currentChain, 0);
    expect(statistics.lastChain, 0);
    expect(statistics.maxChain, 6);
    expect(statistics.playCount, 11);
  });

  test('nextQuiz', () {
    const quizType = QuizTypes.daily;
    final mockQuizRepository = MockQuizRepository();
    when(mockQuizRepository.loadStatistics()).thenReturn(
      const QuizStatistics(
        clearCount: 1,
        currentChain: 5,
        lastChain: 0,
        maxChain: 5,
        playCount: 10,
      ),
    );

    final container = ProviderContainer(
      overrides: [
        quizRepositoryProvider(quizType).overrideWithValue(mockQuizRepository),
      ],
    );

    container.read(statisticsProvider(quizType).notifier).nextQuiz();
    final statistics = container.read(statisticsProvider(quizType));
    expect(statistics.clearCount, 1);
    expect(statistics.currentChain, 5);
    expect(statistics.lastChain, 0);
    expect(statistics.maxChain, 5);
    expect(statistics.playCount, 11);
  });

  test('successQuiz', () {
    const quizType = QuizTypes.daily;
    final mockQuizRepository = MockQuizRepository();
    when(mockQuizRepository.loadStatistics()).thenReturn(
      const QuizStatistics(
        clearCount: 1,
        currentChain: 5,
        lastChain: 0,
        maxChain: 5,
        playCount: 10,
      ),
    );

    final container = ProviderContainer(
      overrides: [
        quizRepositoryProvider(quizType).overrideWithValue(mockQuizRepository),
      ],
    );

    container.read(statisticsProvider(quizType).notifier).successQuiz();
    final statistics = container.read(statisticsProvider(quizType));
    expect(statistics.clearCount, 2);
    expect(statistics.currentChain, 6);
    expect(statistics.lastChain, 0);
    expect(statistics.maxChain, 6);
    expect(statistics.playCount, 10);
  });

  test('finishQuiz', () {
    const quizType = QuizTypes.daily;
    final mockQuizRepository = MockQuizRepository();
    when(mockQuizRepository.loadStatistics()).thenReturn(
      const QuizStatistics(
        clearCount: 1,
        currentChain: 5,
        lastChain: 0,
        maxChain: 5,
        playCount: 10,
      ),
    );

    final container = ProviderContainer(
      overrides: [
        quizRepositoryProvider(quizType).overrideWithValue(mockQuizRepository),
      ],
    );

    container.read(statisticsProvider(quizType).notifier).finishQuiz();
    final statistics = container.read(statisticsProvider(quizType));
    expect(statistics.clearCount, 1);
    expect(statistics.currentChain, 0);
    expect(statistics.lastChain, 5);
    expect(statistics.maxChain, 5);
    expect(statistics.playCount, 10);
  });
}
