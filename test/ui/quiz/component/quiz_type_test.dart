import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';

void main() {
  testWidgets('QuizType.of()', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: QuizType(
          quizType: QuizTypes.daily,
          child: Container(),
        ),
      ),
    );

    final context = tester.element(find.byType(Container));
    expect(QuizType.of(context).quizType, QuizTypes.daily);
  });

  testWidgets('updateShouldNotify', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: QuizType(
          quizType: QuizTypes.daily,
          child: Container(),
        ),
      ),
    );

    final quizType = tester.widget<QuizType>(find.byType(QuizType));
    expect(
      quizType.updateShouldNotify(
        QuizType(
          quizType: QuizTypes.daily,
          child: Container(),
        ),
      ),
      isFalse,
    );

    expect(
      quizType.updateShouldNotify(
        QuizType(
          quizType: QuizTypes.endless,
          child: Container(),
        ),
      ),
      isTrue,
    );
  });
}
