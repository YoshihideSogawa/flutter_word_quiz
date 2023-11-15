import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/provider/quiz_page_provider.dart';
import 'package:word_quiz/ui/quiz/component/answer_button.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';

import '../../../mock/generate_mocks.mocks.dart';

void main() {
  testWidgets('AnswerButton', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: QuizType(
          quizType: QuizTypes.daily,
          child: AnswerButton(),
        ),
      ),
    );

    expect(find.text('こたえ'), findsOneWidget);
  });

  testWidgets('AnswerButtonのタップ', (tester) async {
    final mockQuizPageNotifier = MockQuizPageNotifier();
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizPageProvider(QuizTypes.daily)
              .overrideWith((ref) => mockQuizPageNotifier),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: QuizTypes.daily,
            child: AnswerButton(),
          ),
        ),
      ),
    );

    await tester.tap(find.byKey(const Key('answer_button_ink_well')));
    await tester.pumpAndSettle();

    verify(mockQuizPageNotifier.showAnswer()).called(1);
  });
}
