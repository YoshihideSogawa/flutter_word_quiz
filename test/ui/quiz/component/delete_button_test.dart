import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/model/word_input.dart';
import 'package:word_quiz/ui/quiz/component/delete_button.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';

import '../../../mock/mock_box_data.dart';

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
    const wordInput = WordInput(
      wordsList: [
        ['フ', 'シ', 'ギ', 'ダ', 'ネ'],
      ],
    );
    final quizOverrideBox = quizOverrideAndBox(
      quizType: quizType,
      wordInput: wordInput,
    );
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizOverrideBox.override,
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: DeleteButton(),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('delete_button_ink_well')));
    await tester.pumpAndSettle();

    final wordInputData = parseWordInput(quizOverrideBox.box);
    expect(
      wordInputData?.wordsList.first,
      ['フ', 'シ', 'ギ', 'ダ'],
    );
  });
}
