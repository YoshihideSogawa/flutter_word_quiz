import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/provider/quiz_page_provider.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';
import 'package:word_quiz/ui/quiz/component/result_button.dart';

import '../../../mock/generate_mocks.mocks.dart';

void main() {
  testWidgets('ResultButton', (tester) async {
    final mockQuizPageNotifier = MockQuizPageNotifier();
    const quizType = QuizTypes.daily;
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizPageProvider(quizType)
              .overrideWithValue(mockQuizPageNotifier),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: ResultButton(),
            ),
          ),
        ),
      ),
    );

    expect(find.text('けっか'), findsOneWidget);

    await tester.tap(find.byKey(const Key('result_button')));
    verify(mockQuizPageNotifier.showResult()).called(1);
  });
}
