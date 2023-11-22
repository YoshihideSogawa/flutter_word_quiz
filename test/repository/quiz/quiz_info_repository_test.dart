import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:word_quiz/model/monster.dart';
import 'package:word_quiz/model/quiz_info.dart';
import 'package:word_quiz/model/quiz_process_type.dart';
import 'package:word_quiz/model/quiz_range.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/repository/quiz/quiz_info_repository.dart';

import '../../mock/mock_box_data.dart';

void main() {
  test('QuizInfo(save/load)', () async {
    const quizType = QuizTypes.daily;
    final container = ProviderContainer(
      overrides: [
        quizOverride(quizType: quizType),
      ],
    );
    const quizInfo = QuizInfo(
      answer: Monster(id: 100, name: 'テスト'),
      maxAnswer: 5,
      quizType: quizType,
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
    await container
        .read(quizInfoRepositoryProvider(quizType).notifier)
        .saveQuizInfo(quizInfo);

    // 読み込み
    final targetQuizInfo =
        await container.read(quizInfoRepositoryProvider(quizType).future);

    expect(targetQuizInfo!.answer!.id, quizInfo.answer!.id);
    expect(targetQuizInfo.maxAnswer, quizInfo.maxAnswer);
    expect(targetQuizInfo.quizType, quizInfo.quizType);
    expect(targetQuizInfo.quizProcess, quizInfo.quizProcess);
    expect(targetQuizInfo.quizRange!.id, quizInfo.quizRange!.id);
    expect(targetQuizInfo.seedText, quizInfo.seedText);
    expect(targetQuizInfo.playDate, quizInfo.playDate);
  });
}
