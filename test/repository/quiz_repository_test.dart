import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/constant/box_names.dart';
import 'package:word_quiz/model/monster.dart';
import 'package:word_quiz/model/quiz_info.dart';
import 'package:word_quiz/model/quiz_process_type.dart';
import 'package:word_quiz/model/quiz_range.dart';
import 'package:word_quiz/model/quiz_statistics.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/model/word_input.dart';
import 'package:word_quiz/model/word_keyboard_state.dart';
import 'package:word_quiz/model/word_name_state.dart';
import 'package:word_quiz/repository/quiz_repository.dart';

import '../mock/hive_tester.dart';

void main() {
  setUp(() async {
    setUpHive();
    await Hive.openBox<dynamic>(dailyBoxName);
    await Hive.openBox<dynamic>(endlessBoxName);
  });

  tearDown(tearDownHive);

  test('QuizInfo(save/load)', () async {
    final container = ProviderContainer();
    final quizRepository =
        container.read(quizRepositoryProvider(QuizTypes.daily));

    const quizInfo = QuizInfo(
      answer: Monster(id: 100, name: 'テスト'),
      maxAnswer: 5,
      quizType: QuizTypes.daily,
      quizProcess: QuizProcessType.started,
      quizRange: QuizRange(
        id: 10,
        maxNo: 100,
        displayName: 'QuizRange',
      ),
      seedText: 'seedText',
      playDate: 12345678,
    );

    // 保存
    await quizRepository.saveQuizInfo(quizInfo);

    // 読み込み
    final targetQuizInfo = quizRepository.loadQuizInfo();

    expect(targetQuizInfo!.answer!.id, quizInfo.answer!.id);
    expect(targetQuizInfo.maxAnswer, quizInfo.maxAnswer);
    expect(targetQuizInfo.quizType, quizInfo.quizType);
    expect(targetQuizInfo.quizProcess, quizInfo.quizProcess);
    expect(targetQuizInfo.quizRange!.id, quizInfo.quizRange!.id);
    expect(targetQuizInfo.seedText, quizInfo.seedText);
    expect(targetQuizInfo.playDate, quizInfo.playDate);
  });

  test('WordInput(save/load)', () async {
    final container = ProviderContainer();
    final quizRepository =
        container.read(quizRepositoryProvider(QuizTypes.endless));

    const wordInput = WordInput(
      wordsList: [
        ['テ', 'ス', 'ト']
      ],
      wordsResultList: [
        [WordNameState.notMatch, WordNameState.hit, WordNameState.match]
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
    final container = ProviderContainer();
    final quizRepository =
        container.read(quizRepositoryProvider(QuizTypes.endless));

    const statistics = QuizStatistics(
      clearCount: 10,
      currentChain: 4,
      lastChain: 3,
      maxChain: 5,
      playCount: 10,
    );

    // 保存
    await quizRepository.saveStatistics(statistics);

    // 読み込み
    final targetStatistics = quizRepository.loadStatistics();

    expect(targetStatistics!.clearCount, statistics.clearCount);
    expect(targetStatistics.currentChain, statistics.currentChain);
    expect(targetStatistics.lastChain, statistics.lastChain);
    expect(targetStatistics.maxChain, statistics.maxChain);
    expect(targetStatistics.playCount, statistics.playCount);
  });

  test('deleteAll', () async {
    final container = ProviderContainer();
    final quizRepository =
        container.read(quizRepositoryProvider(QuizTypes.endless));

    const statistics = QuizStatistics(
      clearCount: 10,
      currentChain: 4,
      lastChain: 3,
      maxChain: 5,
      playCount: 10,
    );

    // 保存
    await quizRepository.saveStatistics(statistics);

    // 全削除
    await quizRepository.deleteAll();

    // 読み込み
    final targetStatistics = quizRepository.loadStatistics();

    expect(targetStatistics, isNull);
  });
}
