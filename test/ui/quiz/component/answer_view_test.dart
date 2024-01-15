import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/monster.dart';
import 'package:word_quiz/model/quiz_info.dart';
import 'package:word_quiz/model/quiz_page_info.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/provider/quiz_info_provider.dart';
import 'package:word_quiz/ui/quiz/component/answer_view.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';

import '../../../mock/legacy_fake_quiz_info_notifier.dart';

void main() {
  testWidgets('AnswerView', (tester) async {
    final fakeQuizInfoNotifier = LegacyFakeQuizInfoNotifier(
      const AsyncValue.data(
        QuizInfo(
          answer: Monster(
            id: 1,
            name: 'フシギダネ',
          ),
        ),
      ),
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizInfoProvider(QuizTypes.daily)
              .overrideWith((ref) => fakeQuizInfoNotifier),
        ],
        child: MaterialApp(
          home: QuizType(
            quizType: QuizTypes.daily,
            child: AnswerView(
              quizPageInfo: ValueNotifier(const QuizPageInfo()),
            ),
          ),
        ),
      ),
    );

    expect(find.text('フシギダネ'), findsOneWidget);
  });

  testWidgets('AnswerViewを閉じる', (tester) async {
    final quizPageInfo = ValueNotifier(const QuizPageInfo());
    final fakeQuizInfoNotifier = LegacyFakeQuizInfoNotifier(
      const AsyncValue.data(
        QuizInfo(
          answer: Monster(
            id: 1,
            name: 'フシギダネ',
          ),
        ),
      ),
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizInfoProvider(QuizTypes.daily)
              .overrideWith((ref) => fakeQuizInfoNotifier),
        ],
        child: MaterialApp(
          home: QuizType(
            quizType: QuizTypes.daily,
            child: AnswerView(
              quizPageInfo: ValueNotifier(const QuizPageInfo()),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    await tester.tapAt(Offset.zero);
    await tester.pumpAndSettle();

    expect(quizPageInfo.value.showAnswer, isFalse);
  });
}
