import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/constant/box_names.dart';
import 'package:word_quiz/model/quiz_page_info.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/model/settings_input_type.dart';
import 'package:word_quiz/model/word_input.dart';
import 'package:word_quiz/model/word_keyboard_state.dart';
import 'package:word_quiz/provider/quiz_page_provider.dart';
import 'package:word_quiz/provider/word_input_provider.dart';
import 'package:word_quiz/repository/hive_box_provider.dart';
import 'package:word_quiz/ui/quiz/component/input_key.dart';
import 'package:word_quiz/ui/quiz/component/keyboard_map.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';
import 'package:word_quiz/ui/quiz/component/word_keyboard.dart';

import '../../../mock/fake_quiz_page_notifier.dart';
import '../../../mock/fake_word_input_notifier.dart';
import '../../../mock/mock_box_data.dart';

void main() {
  testWidgets('WordKeyboard(きりかえタイプ、通常キー)', (tester) async {
    const quizType = QuizTypes.daily;
    final fakeQuizPageNotifier = FakeQuizPageNotifier(
      const QuizPageInfo(),
    );
    final fakeWordInputNotifier = FakeWordInputNotifier(
      const WordInput(),
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizPageProvider(quizType)
              .overrideWith((ref) => fakeQuizPageNotifier),
          hiveBoxProvider(settingsBoxName).overrideWith(
            (ref) => settingsBox(inputType: InputTypes.switching),
          ),
          wordInputNotifierProvider(quizType)
              .overrideWith((ref) => fakeWordInputNotifier),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: WordKeyboard(),
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
    final fakeQuizPageNotifier = FakeQuizPageNotifier(
      const QuizPageInfo(
        normalKeyboard: false,
      ),
    );
    final fakeWordInputNotifier = FakeWordInputNotifier(
      const WordInput(),
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizPageProvider(quizType)
              .overrideWith((ref) => fakeQuizPageNotifier),
          hiveBoxProvider(settingsBoxName).overrideWith(
            (ref) => settingsBox(inputType: InputTypes.switching),
          ),
          wordInputNotifierProvider(quizType)
              .overrideWith((ref) => fakeWordInputNotifier),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: WordKeyboard(),
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
    final fakeQuizPageNotifier = FakeQuizPageNotifier(
      const QuizPageInfo(
        normalKeyboard: false,
      ),
    );
    final fakeWordInputNotifier = FakeWordInputNotifier(
      const WordInput(
        keyResultList: <String, WordKeyboardInfo>{
          'ア': WordKeyboardInfo.notMatch,
        },
      ),
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizPageProvider(quizType)
              .overrideWith((ref) => fakeQuizPageNotifier),
          hiveBoxProvider(settingsBoxName)
              .overrideWith((ref) => settingsBox(inputType: InputTypes.all)),
          wordInputNotifierProvider(quizType)
              .overrideWith((ref) => fakeWordInputNotifier),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: WordKeyboard(),
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
}
