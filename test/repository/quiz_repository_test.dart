import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/constant/box_names.dart';
import 'package:word_quiz/model/quiz_statistics.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/model/word_input.dart';
import 'package:word_quiz/model/word_keyboard_state.dart';
import 'package:word_quiz/model/word_name_state.dart';
import 'package:word_quiz/repository/quiz/quiz_data_repository.dart';
import 'package:word_quiz/repository/quiz/statistics_repository.dart';
import 'package:word_quiz/repository/quiz_repository.dart';

import '../mock/hive_tester.dart';
import '../mock/mock_box_data.dart';

void main() {
  setUp(() async {
    setUpHive();
    await Hive.openBox<dynamic>(dailyBoxName);
    await Hive.openBox<dynamic>(endlessBoxName);
  });

  tearDown(tearDownHive);

  test('WordInput(save/load)', () async {
    final container = ProviderContainer();
    final quizRepository =
        container.read(quizRepositoryProvider(QuizTypes.endless));

    const wordInput = WordInput(
      wordsList: [
        ['テ', 'ス', 'ト'],
      ],
      wordsResultList: [
        [WordNameState.notMatch, WordNameState.hit, WordNameState.match],
      ],
      keyResultList: {
        'テ': WordKeyboardInfo.notMatch,
        'ス': WordKeyboardInfo.hit,
        'ト': WordKeyboardInfo.match,
      },
      inputIndex: 1,
      isWordChecking: true,
    );

    // 保存
    await quizRepository.saveWordInput(wordInput);

    // 読み込み
    final targetWordInfo = quizRepository.loadWordInput();

    expect(targetWordInfo!.wordsList, wordInput.wordsList);
    expect(targetWordInfo.wordsResultList, wordInput.wordsResultList);
    expect(targetWordInfo.keyResultList, wordInput.keyResultList);
    expect(targetWordInfo.inputIndex, wordInput.inputIndex);
    expect(targetWordInfo.isWordChecking, wordInput.isWordChecking);
  });

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
