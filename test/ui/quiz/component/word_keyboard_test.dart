import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/quiz_page_info.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/model/settings_input_type.dart';
import 'package:word_quiz/model/word_input.dart';
import 'package:word_quiz/model/word_keyboard_state.dart';
import 'package:word_quiz/model/word_name_state.dart';
import 'package:word_quiz/ui/quiz/component/input_key.dart';
import 'package:word_quiz/ui/quiz/component/keyboard_map.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';
import 'package:word_quiz/ui/quiz/component/word_keyboard.dart';

import '../../../mock/mock_box_data.dart';

void main() {
  testWidgets('WordKeyboard(きりかえタイプ、通常キー)', (tester) async {
    const quizType = QuizTypes.daily;
    final quizPageInfo = ValueNotifier(const QuizPageInfo());
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizOverride(quizType: quizType),
          settingsOverride(inputType: InputTypes.switching),
        ],
        child: MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: WordKeyboard(
                wordAnimation: ValueNotifier(true),
                quizPageInfo: quizPageInfo,
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(InputKey), findsNWidgets(standardKeyboardMap.length));
  });

  testWidgets('WordKeyboard(きりかえタイプ、特殊キー)', (tester) async {
    const quizType = QuizTypes.daily;
    final quizPageInfo = ValueNotifier(const QuizPageInfo());
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizOverride(quizType: quizType),
          settingsOverride(inputType: InputTypes.switching),
        ],
        child: MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: WordKeyboard(
                wordAnimation: ValueNotifier(true),
                quizPageInfo: quizPageInfo,
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(InputKey), findsNWidgets(advancedKeyboardMap.length));
  });

  testWidgets('WordKeyboard(全表示タイプ)', (tester) async {
    const quizType = QuizTypes.daily;
    await tester.binding.setSurfaceSize(const Size(1000, 1000));
    final quizPageInfo = ValueNotifier(const QuizPageInfo());
    const wordInput = WordInput(
      keyResultList: <String, WordKeyboardInfo>{
        'ア': WordKeyboardInfo.notMatch,
      },
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizOverride(quizType: quizType, wordInput: wordInput),
          settingsOverride(inputType: InputTypes.all),
        ],
        child: MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: WordKeyboard(
                wordAnimation: ValueNotifier(true),
                quizPageInfo: quizPageInfo,
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(
      find.byType(InputKey),
      findsNWidgets(standardKeyboardMap.length + advancedKeyboardMap.length),
    );
  });

  testWidgets('change wordResult List', (tester) async {
    const quizType = QuizTypes.daily;
    await tester.binding.setSurfaceSize(const Size(1000, 1000));
    final quizPageInfo = ValueNotifier(const QuizPageInfo());
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
    final quizOverrideBox = quizOverrideAndBox(
      quizType: quizType,
      wordInput: wordInput,
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizOverrideBox.override,
          settingsOverride(inputType: InputTypes.all),
        ],
        child: MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: WordKeyboard(
                wordAnimation: ValueNotifier(true),
                quizPageInfo: quizPageInfo,
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.pump(const Duration(seconds: 2));

    // 1つ抽出してチェック
    final inputKeys = tester.widgetList<InputKey>(find.byType(InputKey));
    final hitKey = inputKeys.firstWhereOrNull(
      (element) => element.keyboardInfo == WordKeyboardInfo.notMatch,
    );
    expect(hitKey?.text, 'フ');
  });
}
