import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/provider/word_input_provider.dart';
import 'package:word_quiz/ui/quiz/component/delete_button.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';

import '../../../mock/generate_mocks.mocks.dart';

void main() {
  testWidgets('DeleteButton', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: QuizType(
            quizType: QuizTypes.daily,
            child: DeleteButton(),
          ),
        ),
      ),
    );

    expect(find.byKey(const Key('delete_button_ink_well')), findsOneWidget);
  });

  testWidgets('DeleteButtonのタップ', (tester) async {
    const quizType = QuizTypes.daily;
    final mockWordInputNotifier = MockWordInputNotifier();
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          wordInputNotifierProvider(quizType)
              .overrideWith((ref) => mockWordInputNotifier),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: DeleteButton(),
          ),
        ),
      ),
    );

    await tester.tap(find.byKey(const Key('delete_button_ink_well')));
    await tester.pumpAndSettle();

    verify(mockWordInputNotifier.deleteWord()).called(1);
  });
}
