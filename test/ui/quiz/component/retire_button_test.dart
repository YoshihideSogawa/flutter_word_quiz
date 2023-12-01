import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/provider/quiz_info_provider.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';
import 'package:word_quiz/ui/quiz/component/retire_button.dart';

import '../../../mock/generate_mocks.mocks.dart';
import '../../../mock/mock_box_data.dart';

void main() {
  testWidgets('RetireButton', (tester) async {
    const quizType = QuizTypes.daily;
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: RetireButton(),
            ),
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.flag_outlined), findsOneWidget);
  });

  testWidgets('RetireButton(Tap)', (tester) async {
    const quizType = QuizTypes.daily;
    final mockQuizInfoNotifier = MockQuizInfoNotifier();
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizOverride(quizType: quizType),
          quizInfoProvider(quizType)
              .overrideWith((ref) => mockQuizInfoNotifier),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: RetireButton(),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('retire_button')));
    await tester.pumpAndSettle();
    expect(find.text('あきらめますか？'), findsOneWidget);
    await tester.tap(find.text('はい'));
    await tester.pumpAndSettle();
    verify(mockQuizInfoNotifier.retireQuiz()).called(1);
  });
}
