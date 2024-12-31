import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/quiz_page_info.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/ui/quiz/component/answer_button.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';

void main() {
  testWidgets('AnswerButton', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: QuizType(
          quizType: QuizTypes.daily,
          child: AnswerButton(
            quizPageInfo: ValueNotifier(
              const QuizPageInfo(),
            ),
          ),
        ),
      ),
    );

    expect(find.text('こたえ'), findsOneWidget);
  });

  testWidgets('AnswerButtonのタップ', (tester) async {
    final quizPageInfo = ValueNotifier(const QuizPageInfo());

    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: QuizType(
            quizType: QuizTypes.daily,
            child: AnswerButton(quizPageInfo: quizPageInfo),
          ),
        ),
      ),
    );

    await tester.tap(find.byKey(const Key('answer_button_ink_well')));
    await tester.pumpAndSettle();

    expect(quizPageInfo.value.showAnswer, isTrue);
  });
}
