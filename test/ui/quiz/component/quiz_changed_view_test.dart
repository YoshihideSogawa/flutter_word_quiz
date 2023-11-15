import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/provider/quiz_page_provider.dart';
import 'package:word_quiz/ui/quiz/component/quiz_changed_view.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';

import '../../../mock/generate_mocks.mocks.dart';

void main() {
  testWidgets('QuizChallengeView', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: QuizType(
            quizType: QuizTypes.daily,
            child: Scaffold(
              body: QuizChangedView(),
            ),
          ),
        ),
      ),
    );

    expect(find.text('もんだいが こうしんされました'), findsOneWidget);
  });

  testWidgets('QuizChallengeView', (tester) async {
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
            child: Scaffold(
              body: QuizChangedView(),
            ),
          ),
        ),
      ),
    );

    await tester.tapAt(Offset.zero);
    verify(mockQuizPageNotifier.dismissQuizChanged()).called(1);

    await tester.tap(find.text('とじる'));
    verify(mockQuizPageNotifier.dismissQuizChanged()).called(1);
  });
}
