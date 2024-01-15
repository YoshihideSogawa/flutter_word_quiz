import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/ui/quiz/component/next_quiz_button.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';

import '../../../mock/mock_box_data.dart';

void main() {
  testWidgets('NextQuizButton', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: QuizType(
            quizType: QuizTypes.daily,
            child: Scaffold(
              body: NextQuizButton(),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('つぎへ'), findsOneWidget);
  });

  testWidgets('NextQuizButtonのタップ', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizOverride(quizType: QuizTypes.daily),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: QuizTypes.daily,
            child: Scaffold(
              body: NextQuizButton(),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('next_quiz_button')));
    await tester.pumpAndSettle();

    // TODO(sogawa): 何らかの形でNEXTを確認する
  });
}
