import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/monster_series.dart';
import 'package:word_quiz/model/quiz_info.dart';
import 'package:word_quiz/model/quiz_page_info.dart';
import 'package:word_quiz/model/quiz_process_type.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/model/settings_input_type.dart';
import 'package:word_quiz/model/word_input.dart';
import 'package:word_quiz/model/word_name_state.dart';
import 'package:word_quiz/provider/quiz_info_provider.dart';
import 'package:word_quiz/ui/quiz/component/answer_button.dart';
import 'package:word_quiz/ui/quiz/component/answer_view.dart';
import 'package:word_quiz/ui/quiz/component/delete_button.dart';
import 'package:word_quiz/ui/quiz/component/enter_button.dart';
import 'package:word_quiz/ui/quiz/component/give_up_button.dart';
import 'package:word_quiz/ui/quiz/component/keyboard_switch_button.dart';
import 'package:word_quiz/ui/quiz/component/next_quiz_button.dart';
import 'package:word_quiz/ui/quiz/component/quiz_changed_view.dart';
import 'package:word_quiz/ui/quiz/component/quiz_footer_info.dart';
import 'package:word_quiz/ui/quiz/component/quiz_selection_view.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';
import 'package:word_quiz/ui/quiz/component/restart_button.dart';
import 'package:word_quiz/ui/quiz/component/result_button.dart';
import 'package:word_quiz/ui/quiz/component/result_view.dart';
import 'package:word_quiz/ui/quiz/component/retire_button.dart';
import 'package:word_quiz/ui/quiz/component/statistics_view.dart';
import 'package:word_quiz/ui/quiz/component/word_keyboard.dart';
import 'package:word_quiz/ui/quiz/component/word_quiz_layout.dart';

import '../../../mock/fake_quiz_info_notifier.dart';
import '../../../mock/mock_box_data.dart';

void main() {
  testWidgets('切り替えモード/Daily/started', (tester) async {
    const quizType = QuizTypes.daily;
    final quizPageInfo = ValueNotifier(
      const QuizPageInfo(
        normalKeyboard: false,
      ),
    );
    final fakeQuizInfoNotifier = FakeQuizInfoNotifier(
      const AsyncValue.data(
        QuizInfo(
          quizType: quizType,
          quizProcess: QuizProcessType.started,
        ),
      ),
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
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizOverride(quizType: quizType, wordInput: wordInput),
          settingsOverride(inputType: InputTypes.switching),
          quizInfoProvider(quizType)
              .overrideWith((ref) => fakeQuizInfoNotifier),
        ],
        child: MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: WordQuizLayout(quizPageInfo: quizPageInfo),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(KeyboardSwitchButton), findsOneWidget);
    expect(find.byType(AnswerButton), findsNothing);
    expect(find.byType(RetireButton), findsOneWidget);
    expect(find.byType(GiveUpButton), findsNothing);
    expect(find.byType(NextQuizButton), findsNothing);
    expect(find.byType(RestartButton), findsNothing);
    expect(find.byType(ResultButton), findsNothing);
    expect(find.byType(DeleteButton), findsOneWidget);
    expect(find.byType(WordKeyboard), findsOneWidget);
    expect(find.byType(EnterButton), findsOneWidget);
    expect(find.byType(QuizFooterInfo), findsOneWidget);
  });

  testWidgets('全表示/Daily/started', (tester) async {
    const quizType = QuizTypes.daily;
    final quizPageInfo = ValueNotifier(
      const QuizPageInfo(
        normalKeyboard: false,
      ),
    );
    final fakeQuizInfoNotifier = FakeQuizInfoNotifier(
      const AsyncValue.data(
        QuizInfo(
          quizType: quizType,
          quizProcess: QuizProcessType.started,
        ),
      ),
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
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizOverride(quizType: quizType, wordInput: wordInput),
          quizInfoProvider(quizType)
              .overrideWith((ref) => fakeQuizInfoNotifier),
          settingsOverride(inputType: InputTypes.all),
        ],
        child: MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: WordQuizLayout(quizPageInfo: quizPageInfo),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(KeyboardSwitchButton), findsNothing);
    expect(find.byType(AnswerButton), findsNothing);
    expect(find.byType(RetireButton), findsOneWidget);
    expect(find.byType(GiveUpButton), findsNothing);
    expect(find.byType(NextQuizButton), findsNothing);
    expect(find.byType(RestartButton), findsNothing);
    expect(find.byType(ResultButton), findsNothing);
    expect(find.byType(DeleteButton), findsOneWidget);
    expect(find.byType(WordKeyboard), findsOneWidget);
    expect(find.byType(EnterButton), findsOneWidget);
    expect(find.byType(QuizFooterInfo), findsOneWidget);
  });

  testWidgets('切り替えモード/Daily/success', (tester) async {
    const quizType = QuizTypes.daily;
    final quizPageInfo = ValueNotifier(
      const QuizPageInfo(
        normalKeyboard: false,
      ),
    );
    final fakeQuizInfoNotifier = FakeQuizInfoNotifier(
      const AsyncValue.data(
        QuizInfo(
          quizType: quizType,
          quizProcess: QuizProcessType.success,
        ),
      ),
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
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizOverride(quizType: quizType, wordInput: wordInput),
          settingsOverride(inputType: InputTypes.switching),
          quizInfoProvider(quizType)
              .overrideWith((ref) => fakeQuizInfoNotifier),
        ],
        child: MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: WordQuizLayout(quizPageInfo: quizPageInfo),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(KeyboardSwitchButton), findsOneWidget);
    expect(find.byType(AnswerButton), findsNothing);
    expect(find.byType(RetireButton), findsNothing);
    expect(find.byType(GiveUpButton), findsNothing);
    expect(find.byType(NextQuizButton), findsNothing);
    expect(find.byType(RestartButton), findsNothing);
    expect(find.byType(ResultButton), findsNothing);
    expect(find.byType(DeleteButton), findsOneWidget);
    expect(find.byType(WordKeyboard), findsOneWidget);
    expect(find.byType(EnterButton), findsOneWidget);
    expect(find.byType(QuizFooterInfo), findsOneWidget);
  });

  testWidgets('切り替えモード/Daily/failure', (tester) async {
    const quizType = QuizTypes.daily;
    final quizPageInfo = ValueNotifier(
      const QuizPageInfo(
        normalKeyboard: false,
      ),
    );
    final fakeQuizInfoNotifier = FakeQuizInfoNotifier(
      const AsyncValue.data(
        QuizInfo(
          quizType: quizType,
          quizProcess: QuizProcessType.failure,
        ),
      ),
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
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizOverride(quizType: quizType, wordInput: wordInput),
          settingsOverride(inputType: InputTypes.switching),
          quizInfoProvider(quizType)
              .overrideWith((ref) => fakeQuizInfoNotifier),
        ],
        child: MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: WordQuizLayout(quizPageInfo: quizPageInfo),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(KeyboardSwitchButton), findsOneWidget);
    expect(find.byType(AnswerButton), findsOneWidget);
    expect(find.byType(RetireButton), findsNothing);
    expect(find.byType(GiveUpButton), findsNothing);
    expect(find.byType(NextQuizButton), findsNothing);
    expect(find.byType(RestartButton), findsNothing);
    expect(find.byType(ResultButton), findsNothing);
    expect(find.byType(DeleteButton), findsOneWidget);
    expect(find.byType(WordKeyboard), findsOneWidget);
    expect(find.byType(EnterButton), findsOneWidget);
    expect(find.byType(QuizFooterInfo), findsOneWidget);
  });

  testWidgets('切り替えモード/endless/none', (tester) async {
    const quizType = QuizTypes.endless;
    final quizPageInfo = ValueNotifier(
      const QuizPageInfo(
        normalKeyboard: false,
      ),
    );
    final fakeQuizInfoNotifier = FakeQuizInfoNotifier(
      const AsyncValue.data(
        QuizInfo(
          quizType: quizType,
        ),
      ),
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
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizOverride(quizType: quizType, wordInput: wordInput),
          settingsOverride(inputType: InputTypes.switching),
          quizInfoProvider(quizType)
              .overrideWith((ref) => fakeQuizInfoNotifier),
        ],
        child: MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: WordQuizLayout(quizPageInfo: quizPageInfo),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(KeyboardSwitchButton), findsOneWidget);
    expect(find.byType(AnswerButton), findsNothing);
    expect(find.byType(RetireButton), findsNothing);
    expect(find.byType(GiveUpButton), findsNothing);
    expect(find.byType(NextQuizButton), findsNothing);
    expect(find.byType(RestartButton), findsOneWidget);
    expect(find.byType(ResultButton), findsNothing);
    expect(find.byType(DeleteButton), findsOneWidget);
    expect(find.byType(WordKeyboard), findsOneWidget);
    expect(find.byType(EnterButton), findsOneWidget);
    expect(find.byType(QuizFooterInfo), findsOneWidget);
  });

  testWidgets('切り替えモード/endless/started', (tester) async {
    const quizType = QuizTypes.endless;
    final quizPageInfo = ValueNotifier(
      const QuizPageInfo(
        normalKeyboard: false,
      ),
    );
    final fakeQuizInfoNotifier = FakeQuizInfoNotifier(
      const AsyncValue.data(
        QuizInfo(
          quizType: quizType,
          quizProcess: QuizProcessType.started,
        ),
      ),
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
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizOverride(quizType: quizType, wordInput: wordInput),
          settingsOverride(inputType: InputTypes.switching),
          quizInfoProvider(quizType)
              .overrideWith((ref) => fakeQuizInfoNotifier),
        ],
        child: MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: WordQuizLayout(quizPageInfo: quizPageInfo),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(KeyboardSwitchButton), findsOneWidget);
    expect(find.byType(AnswerButton), findsNothing);
    expect(find.byType(RetireButton), findsOneWidget);
    expect(find.byType(GiveUpButton), findsNothing);
    expect(find.byType(NextQuizButton), findsNothing);
    expect(find.byType(RestartButton), findsNothing);
    expect(find.byType(ResultButton), findsNothing);
    expect(find.byType(DeleteButton), findsOneWidget);
    expect(find.byType(WordKeyboard), findsOneWidget);
    expect(find.byType(EnterButton), findsOneWidget);
    expect(find.byType(QuizFooterInfo), findsOneWidget);
  });

  testWidgets('切り替えモード/endless/success', (tester) async {
    const quizType = QuizTypes.endless;
    final quizPageInfo = ValueNotifier(
      const QuizPageInfo(
        normalKeyboard: false,
      ),
    );
    final fakeQuizInfoNotifier = FakeQuizInfoNotifier(
      const AsyncValue.data(
        QuizInfo(
          quizType: quizType,
          quizProcess: QuizProcessType.success,
        ),
      ),
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
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizOverride(quizType: quizType, wordInput: wordInput),
          settingsOverride(inputType: InputTypes.switching),
          quizInfoProvider(quizType)
              .overrideWith((ref) => fakeQuizInfoNotifier),
        ],
        child: MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: WordQuizLayout(quizPageInfo: quizPageInfo),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(KeyboardSwitchButton), findsOneWidget);
    expect(find.byType(AnswerButton), findsNothing);
    expect(find.byType(RetireButton), findsNothing);
    expect(find.byType(GiveUpButton), findsOneWidget);
    expect(find.byType(NextQuizButton), findsOneWidget);
    expect(find.byType(RestartButton), findsNothing);
    expect(find.byType(ResultButton), findsNothing);
    expect(find.byType(DeleteButton), findsOneWidget);
    expect(find.byType(WordKeyboard), findsOneWidget);
    expect(find.byType(EnterButton), findsOneWidget);
    expect(find.byType(QuizFooterInfo), findsOneWidget);
  });

  testWidgets('切り替えモード/endless/failure', (tester) async {
    const quizType = QuizTypes.endless;
    final quizPageInfo = ValueNotifier(
      const QuizPageInfo(
        normalKeyboard: false,
      ),
    );
    final fakeQuizInfoNotifier = FakeQuizInfoNotifier(
      const AsyncValue.data(
        QuizInfo(
          quizType: quizType,
          quizProcess: QuizProcessType.failure,
        ),
      ),
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
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizOverride(quizType: quizType, wordInput: wordInput),
          settingsOverride(inputType: InputTypes.switching),
          quizInfoProvider(quizType)
              .overrideWith((ref) => fakeQuizInfoNotifier),
        ],
        child: MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: WordQuizLayout(quizPageInfo: quizPageInfo),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(KeyboardSwitchButton), findsOneWidget);
    expect(find.byType(AnswerButton), findsOneWidget);
    expect(find.byType(RetireButton), findsNothing);
    expect(find.byType(GiveUpButton), findsNothing);
    expect(find.byType(NextQuizButton), findsNothing);
    expect(find.byType(RestartButton), findsOneWidget);
    expect(find.byType(ResultButton), findsOneWidget);
    expect(find.byType(DeleteButton), findsOneWidget);
    expect(find.byType(WordKeyboard), findsOneWidget);
    expect(find.byType(EnterButton), findsOneWidget);
    expect(find.byType(QuizFooterInfo), findsOneWidget);
  });

  testWidgets('切り替えモード/endless/quit', (tester) async {
    const quizType = QuizTypes.endless;
    final fakeQuizInfoNotifier = FakeQuizInfoNotifier(
      const AsyncValue.data(
        QuizInfo(
          quizType: quizType,
          quizProcess: QuizProcessType.quit,
        ),
      ),
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
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizOverride(quizType: quizType, wordInput: wordInput),
          settingsOverride(inputType: InputTypes.switching),
          quizInfoProvider(quizType)
              .overrideWith((ref) => fakeQuizInfoNotifier),
        ],
        child: MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: WordQuizLayout(
                quizPageInfo: ValueNotifier(
                  const QuizPageInfo(
                    normalKeyboard: false,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(KeyboardSwitchButton), findsOneWidget);
    expect(find.byType(AnswerButton), findsNothing);
    expect(find.byType(RetireButton), findsNothing);
    expect(find.byType(GiveUpButton), findsNothing);
    expect(find.byType(NextQuizButton), findsNothing);
    expect(find.byType(RestartButton), findsOneWidget);
    expect(find.byType(ResultButton), findsOneWidget);
    expect(find.byType(DeleteButton), findsOneWidget);
    expect(find.byType(WordKeyboard), findsOneWidget);
    expect(find.byType(EnterButton), findsOneWidget);
    expect(find.byType(QuizFooterInfo), findsOneWidget);
  });

  testWidgets('全ダイアログ表示', (tester) async {
    const quizType = QuizTypes.endless;
    final quizPageInfo = ValueNotifier(
      const QuizPageInfo(
        normalKeyboard: false,
        showAnswer: true,
        showStatistics: true,
        showQuizSelection: true,
        showResult: true,
        showQuizChanged: true,
      ),
    );
    final fakeQuizInfoNotifier = FakeQuizInfoNotifier(
      const AsyncValue.data(
        QuizInfo(
          quizType: quizType,
          quizProcess: QuizProcessType.quit,
        ),
      ),
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
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          appPropertyOverride(parentalControl: false),
          quizOverride(quizType: quizType, wordInput: wordInput),
          settingsOverride(
            inputType: InputTypes.switching,
            quizRange: diamondPearl,
          ),
          quizInfoProvider(quizType)
              .overrideWith((ref) => fakeQuizInfoNotifier),
        ],
        child: MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: WordQuizLayout(quizPageInfo: quizPageInfo),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(AnswerView), findsOneWidget);
    expect(find.byType(StatisticsView), findsOneWidget);
    expect(find.byType(QuizSelectionView), findsOneWidget);
    expect(find.byType(ResultView), findsOneWidget);
    expect(find.byType(QuizChangedView), findsOneWidget);
  });
}
