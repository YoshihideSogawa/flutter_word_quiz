import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/model/word_input.dart';
import 'package:word_quiz/model/word_name_state.dart';
import 'package:word_quiz/repository/hive_box_provider.dart';
import 'package:word_quiz/repository/quiz/quiz_keys.dart';
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

  testWidgets('word state null', (tester) async {
    const quizType = QuizTypes.daily;
    const wordInput = WordInput(
      wordsList: [
        ['フ', 'シ', 'ギ', 'ダ', 'ネ'],
      ],
      wordsResultList: [null],
      inputIndex: 1,
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

    await tester.pump(const Duration(seconds: 2));

    expect(find.text('フ'), findsOneWidget);
    expect(find.text('シ'), findsOneWidget);
    expect(find.text('ギ'), findsOneWidget);
    expect(find.text('ダ'), findsOneWidget);
    expect(find.text('ネ'), findsOneWidget);
  });

  testWidgets('word animation', (tester) async {
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
      inputIndex: 1,
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

    await tester.pump(const Duration(seconds: 2));

    expect(find.text('フ'), findsOneWidget);
    expect(find.text('シ'), findsOneWidget);
    expect(find.text('ギ'), findsOneWidget);
    expect(find.text('ダ'), findsOneWidget);
    expect(find.text('ネ'), findsOneWidget);
  });

  testWidgets('change wordResult List', (tester) async {
    const quizType = QuizTypes.daily;
    final quizOverrideBox = quizOverrideAndBox(
      quizType: quizType,
      wordInput: const WordInput(),
    );
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
      inputIndex: 1,
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizOverrideBox.override,
        ],
        child: MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: WordNames(
                wordAnimation: ValueNotifier(false),
              ),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // データの更新
    await quizOverrideBox.box.put(wordInputKey, jsonEncode(wordInput.toJson()));
    await tester.pumpAndSettle();
    ProviderScope.containerOf(tester.element(find.byType(WordNames)))
        .invalidate(hiveBoxProvider(quizType.boxName));

    await tester.pumpAndSettle();

    expect(find.text('フ'), findsOneWidget);
    expect(find.text('シ'), findsOneWidget);
    expect(find.text('ギ'), findsOneWidget);
    expect(find.text('ダ'), findsOneWidget);
    expect(find.text('ネ'), findsOneWidget);
  });
}
