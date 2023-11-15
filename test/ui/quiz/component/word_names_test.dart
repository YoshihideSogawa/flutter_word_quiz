import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/model/word_input.dart';
import 'package:word_quiz/model/word_name_state.dart';
import 'package:word_quiz/provider/word_input_provider.dart';
import 'package:word_quiz/ui/quiz/component/name_text.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';
import 'package:word_quiz/ui/quiz/component/word_names.dart';

import '../../../mock/fake_word_input_notifier.dart';

void main() {
  testWidgets('WordNames', (tester) async {
    const quizType = QuizTypes.daily;
    final fakeWordInputNotifier = FakeWordInputNotifier(
      const WordInput(
        wordsList: [
          ['フ', 'シ', 'ギ', 'ダ', 'ネ']
        ],
        wordsResultList: [
          [
            WordNameState.notMatch,
            WordNameState.notMatch,
            WordNameState.hit,
            WordNameState.match,
          ]
        ],
      ),
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          wordInputNotifierProvider(quizType)
              .overrideWith((ref) => fakeWordInputNotifier),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: WordNames(),
            ),
          ),
        ),
      ),
    );

    expect(find.byType(NameText), findsNWidgets(50));
    expect(find.text('フ'), findsOneWidget);
    expect(find.text('シ'), findsOneWidget);
    expect(find.text('ギ'), findsOneWidget);
    expect(find.text('ダ'), findsOneWidget);
    expect(find.text('ネ'), findsOneWidget);
  });
}
