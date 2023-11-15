import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/provider/quiz_info_provider.dart';
import 'package:word_quiz/ui/quiz/component/give_up_button.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';

import '../../../mock/generate_mocks.mocks.dart';

void main() {
  testWidgets('GiveUpButton', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: QuizType(
            quizType: QuizTypes.daily,
            child: Scaffold(
              body: GiveUpButton(),
            ),
          ),
        ),
      ),
    );

    expect(find.text('おわる'), findsOneWidget);
  });

  testWidgets('GiveUpButton(タップ)', (tester) async {
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
              body: GiveUpButton(),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.byKey(const Key('give_up_button_ink_well')));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('quit_quiz_dialog')), findsOneWidget);

    // はいをタップ
    await tester.tap(find.text('はい'));
    await tester.pumpAndSettle();

    verify(mockQuizInfoNotifier.quitQuiz()).called(1);
  });
}
