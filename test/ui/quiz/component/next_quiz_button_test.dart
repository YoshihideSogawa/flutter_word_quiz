import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/provider/quiz_info_provider.dart';
import 'package:word_quiz/ui/quiz/component/next_quiz_button.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';

import '../../../mock/generate_mocks.mocks.dart';

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

    expect(find.text('つぎへ'), findsOneWidget);
  });

  testWidgets('NextQuizButtonのタップ', (tester) async {
    final mockQuizInfoNotifier = MockQuizInfoNotifier();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizInfoProvider(QuizTypes.daily)
              .overrideWith((ref) => mockQuizInfoNotifier),
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

    await tester.tap(find.byKey(const Key('next_quiz_button')));
    verify(mockQuizInfoNotifier.nextQuiz()).called(1);
  });
}
