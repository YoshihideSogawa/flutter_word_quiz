import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/logic/date_utils.dart';
import 'package:word_quiz/model/quiz_info.dart';
import 'package:word_quiz/model/quiz_process_type.dart';
import 'package:word_quiz/model/quiz_statistics.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/model/word_input.dart';
import 'package:word_quiz/model/word_name_state.dart';
import 'package:word_quiz/provider/quiz_info_notifier.dart';

import '../mock/mock_box_data.dart';
import '../mock/monster_test_list.dart';

void main() {
  test('updateQuiz(正答)', () async {
    const quizType = QuizTypes.daily;
    final quizInfo = QuizInfo(
      answer: monsterTestList[24],
      maxAnswer: 10,
      quizProcess: QuizProcessType.started,
      playDate: generateDate(),
    );
    const wordInput = WordInput(
      wordsResultList: [
        [
          WordNameState.match,
          WordNameState.match,
          WordNameState.match,
          WordNameState.match,
          WordNameState.match,
        ],
      ],
      inputIndex: 1,
    );
    const statistics = QuizStatistics(
      clearCount: 1,
      currentChain: 2,
      maxChain: 2,
      playCount: 3,
    );

    final overrideData = quizOverrideAndBox(
      quizType: quizType,
      quizInfo: quizInfo,
      wordInput: wordInput,
      statistics: statistics,
    );
    final container = ProviderContainer(overrides: [overrideData.override]);

    await container.read(quizInfoNotifierProvider(quizType).future);
    final result = await container
        .read(quizInfoNotifierProvider(quizType).notifier)
        .updateQuiz();

    expect(result, isTrue);

    final updatedQuizInfo = await container.read(
      quizInfoNotifierProvider(quizType).future,
    );
    expect(updatedQuizInfo.quizProcess, QuizProcessType.success);

    final updatedStatistics = parseQuizStatistics(overrideData.box);
    expect(updatedStatistics?.clearCount, 2);
    expect(updatedStatistics?.currentChain, 3);
    expect(updatedStatistics?.maxChain, 3);
    expect(updatedStatistics?.playCount, 3);
  });

  test('updateQuiz(一致数が解答文字数より少ない場合は正答にしない(例：サンダーとサンダース))', () async {
    const quizType = QuizTypes.daily;
    final quizInfo = QuizInfo(
      answer: monsterTestList[24],
      maxAnswer: 10,
      quizProcess: QuizProcessType.started,
      playDate: generateDate(),
    );
    const wordInput = WordInput(
      wordsResultList: [
        [
          WordNameState.match,
          WordNameState.match,
          WordNameState.match,
          WordNameState.match,
        ],
      ],
      inputIndex: 1,
    );
    const statistics = QuizStatistics(
      clearCount: 1,
      currentChain: 2,
      maxChain: 2,
      playCount: 3,
    );

    final overrideData = quizOverrideAndBox(
      quizType: quizType,
      quizInfo: quizInfo,
      wordInput: wordInput,
      statistics: statistics,
    );
    final container = ProviderContainer(overrides: [overrideData.override]);

    await container.read(quizInfoNotifierProvider(quizType).future);
    final result = await container
        .read(quizInfoNotifierProvider(quizType).notifier)
        .updateQuiz();

    expect(result, isNull);

    final updatedQuizInfo = await container.read(
      quizInfoNotifierProvider(quizType).future,
    );
    expect(updatedQuizInfo.quizProcess, QuizProcessType.started);

    final updatedStatistics = parseQuizStatistics(overrideData.box);
    expect(updatedStatistics, statistics);
  });
}
