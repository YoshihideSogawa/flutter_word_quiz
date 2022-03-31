import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/provider/quiz_page_provider.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';
import 'package:word_quiz/ui/quiz/component/restart_button.dart';

import '../../../mock/generate_mocks.mocks.dart';

void main() {
  testWidgets('RestartButton', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: QuizType(
            quizType: QuizTypes.daily,
            child: Scaffold(
              body: RestartButton(),
            ),
          ),
        ),
      ),
    );

    expect(find.text('はじめる'), findsOneWidget);
  });

  testWidgets('RestartButton Tap', (tester) async {
    final mockQuizPageNotifier = MockQuizPageNotifier();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizPageProvider(QuizTypes.daily)
              .overrideWithValue(mockQuizPageNotifier),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: QuizTypes.daily,
            child: Scaffold(
              body: RestartButton(),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.byKey(const Key('restart_button_ink_well')));
    verify(mockQuizPageNotifier.showQuizSelection()).called(1);
  });
}
