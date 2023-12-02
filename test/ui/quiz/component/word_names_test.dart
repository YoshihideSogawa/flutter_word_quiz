import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/model/word_input.dart';
import 'package:word_quiz/model/word_name_state.dart';
import 'package:word_quiz/ui/quiz/component/name_text.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';
import 'package:word_quiz/ui/quiz/component/word_names.dart';

import '../../../mock/mock_box_data.dart';

void main() {
  testWidgets('WordNames', (tester) async {
    const quizType = QuizTypes.daily;
    const wordInput = WordInput(
      wordsList: [
        ['フ', 'シ', 'ギ', 'ダ', 'ネ'],
      ],
      wordsResultList: [
        [
          WordNameState.notMatch,
          WordNameState.notMatch,
          WordNameState.hit,
          WordNameState.match,
        ]
      ],
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizOverride(quizType: quizType, wordInput: wordInput),
        ],
        child: MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: WordNames(
                wordAnimation: ValueNotifier(true),
              ),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(NameText), findsNWidgets(50));
    expect(find.text('フ'), findsOneWidget);
    expect(find.text('シ'), findsOneWidget);
    expect(find.text('ギ'), findsOneWidget);
    expect(find.text('ダ'), findsOneWidget);
    expect(find.text('ネ'), findsOneWidget);
  });
}
