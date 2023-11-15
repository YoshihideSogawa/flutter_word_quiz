import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:word_quiz/model/quiz_info.dart';
import 'package:word_quiz/model/quiz_page_info.dart';
import 'package:word_quiz/model/quiz_process_type.dart';
import 'package:word_quiz/model/quiz_statistics.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/model/settings_input_type.dart';
import 'package:word_quiz/model/word_input.dart';
import 'package:word_quiz/model/word_name_state.dart';
import 'package:word_quiz/provider/parental_control_provider.dart';
import 'package:word_quiz/provider/quiz_info_provider.dart';
import 'package:word_quiz/provider/quiz_page_provider.dart';
import 'package:word_quiz/provider/settings_input_type_provider.dart';
import 'package:word_quiz/provider/statistics_provider.dart';
import 'package:word_quiz/provider/word_input_provider.dart';
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
import '../../../mock/fake_quiz_page_notifier.dart';
import '../../../mock/fake_settings_input_type_notifier.dart';
import '../../../mock/fake_statistics_notifier.dart';
import '../../../mock/fake_word_input_notifier.dart';
import '../../../mock/generate_mocks.mocks.dart';

void main() {
  testWidgets('切り替えモード/Daily/started', (tester) async {
    const quizType = QuizTypes.daily;
    final fakeSettingsInputTypeNotifier =
        FakeSettingsInputTypeNotifier(inputTypeSwitching);
    final fakeQuizPageNotifier = FakeQuizPageNotifier(
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
          quizInfoProvider(quizType)
              .overrideWith((ref) => fakeQuizInfoNotifier),
          quizPageProvider(quizType)
              .overrideWith((ref) => fakeQuizPageNotifier),
          settingsInputTypeProvider
              .overrideWith((ref) => fakeSettingsInputTypeNotifier),
          wordInputNotifierProvider(quizType)
              .overrideWith((ref) => fakeWordInputNotifier),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: WordQuizLayout(),
            ),
          ),
        ),
      ),
    );

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
    final fakeSettingsInputTypeNotifier =
        FakeSettingsInputTypeNotifier(inputTypeAll);
    final fakeQuizPageNotifier = FakeQuizPageNotifier(
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
          quizInfoProvider(quizType)
              .overrideWith((ref) => fakeQuizInfoNotifier),
          quizPageProvider(quizType)
              .overrideWith((ref) => fakeQuizPageNotifier),
          settingsInputTypeProvider
              .overrideWith((ref) => fakeSettingsInputTypeNotifier),
          wordInputNotifierProvider(quizType)
              .overrideWith((ref) => fakeWordInputNotifier),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: WordQuizLayout(),
            ),
          ),
        ),
      ),
    );

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
    final fakeSettingsInputTypeNotifier =
        FakeSettingsInputTypeNotifier(inputTypeSwitching);
    final fakeQuizPageNotifier = FakeQuizPageNotifier(
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
          quizInfoProvider(quizType)
              .overrideWith((ref) => fakeQuizInfoNotifier),
          quizPageProvider(quizType)
              .overrideWith((ref) => fakeQuizPageNotifier),
          settingsInputTypeProvider
              .overrideWith((ref) => fakeSettingsInputTypeNotifier),
          wordInputNotifierProvider(quizType)
              .overrideWith((ref) => fakeWordInputNotifier),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: WordQuizLayout(),
            ),
          ),
        ),
      ),
    );

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
    final fakeSettingsInputTypeNotifier =
        FakeSettingsInputTypeNotifier(inputTypeSwitching);
    final fakeQuizPageNotifier = FakeQuizPageNotifier(
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
          quizInfoProvider(quizType)
              .overrideWith((ref) => fakeQuizInfoNotifier),
          quizPageProvider(quizType)
              .overrideWith((ref) => fakeQuizPageNotifier),
          settingsInputTypeProvider
              .overrideWith((ref) => fakeSettingsInputTypeNotifier),
          wordInputNotifierProvider(quizType)
              .overrideWith((ref) => fakeWordInputNotifier),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: WordQuizLayout(),
            ),
          ),
        ),
      ),
    );

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
    final fakeSettingsInputTypeNotifier =
        FakeSettingsInputTypeNotifier(inputTypeSwitching);
    final fakeQuizPageNotifier = FakeQuizPageNotifier(
      const QuizPageInfo(
        normalKeyboard: false,
      ),
    );
    final fakeQuizInfoNotifier = FakeQuizInfoNotifier(
      const AsyncValue.data(
        QuizInfo(
          quizType: quizType,
          quizProcess: QuizProcessType.none,
        ),
      ),
    );

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
          quizInfoProvider(quizType)
              .overrideWith((ref) => fakeQuizInfoNotifier),
          quizPageProvider(quizType)
              .overrideWith((ref) => fakeQuizPageNotifier),
          settingsInputTypeProvider
              .overrideWith((ref) => fakeSettingsInputTypeNotifier),
          wordInputNotifierProvider(quizType)
              .overrideWith((ref) => fakeWordInputNotifier),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: WordQuizLayout(),
            ),
          ),
        ),
      ),
    );

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
    final fakeSettingsInputTypeNotifier =
        FakeSettingsInputTypeNotifier(inputTypeSwitching);
    final fakeQuizPageNotifier = FakeQuizPageNotifier(
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

    final fakeStatisticsNotifier =
        FakeStatisticsNotifier(const QuizStatistics());

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
          quizInfoProvider(quizType)
              .overrideWith((ref) => fakeQuizInfoNotifier),
          quizPageProvider(quizType)
              .overrideWith((ref) => fakeQuizPageNotifier),
          settingsInputTypeProvider
              .overrideWith((ref) => fakeSettingsInputTypeNotifier),
          wordInputNotifierProvider(quizType)
              .overrideWith((ref) => fakeWordInputNotifier),
          statisticsProvider(quizType)
              .overrideWith((ref) => fakeStatisticsNotifier),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: WordQuizLayout(),
            ),
          ),
        ),
      ),
    );

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
    final fakeSettingsInputTypeNotifier =
        FakeSettingsInputTypeNotifier(inputTypeSwitching);
    final fakeQuizPageNotifier = FakeQuizPageNotifier(
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

    final fakeStatisticsNotifier =
        FakeStatisticsNotifier(const QuizStatistics());

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
          quizInfoProvider(quizType)
              .overrideWith((ref) => fakeQuizInfoNotifier),
          quizPageProvider(quizType)
              .overrideWith((ref) => fakeQuizPageNotifier),
          settingsInputTypeProvider
              .overrideWith((ref) => fakeSettingsInputTypeNotifier),
          wordInputNotifierProvider(quizType)
              .overrideWith((ref) => fakeWordInputNotifier),
          statisticsProvider(quizType)
              .overrideWith((ref) => fakeStatisticsNotifier),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: WordQuizLayout(),
            ),
          ),
        ),
      ),
    );

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
    final fakeSettingsInputTypeNotifier =
        FakeSettingsInputTypeNotifier(inputTypeSwitching);
    final fakeQuizPageNotifier = FakeQuizPageNotifier(
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

    final fakeStatisticsNotifier =
        FakeStatisticsNotifier(const QuizStatistics());

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
          quizInfoProvider(quizType)
              .overrideWith((ref) => fakeQuizInfoNotifier),
          quizPageProvider(quizType)
              .overrideWith((ref) => fakeQuizPageNotifier),
          settingsInputTypeProvider
              .overrideWith((ref) => fakeSettingsInputTypeNotifier),
          wordInputNotifierProvider(quizType)
              .overrideWith((ref) => fakeWordInputNotifier),
          statisticsProvider(quizType)
              .overrideWith((ref) => fakeStatisticsNotifier),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: WordQuizLayout(),
            ),
          ),
        ),
      ),
    );

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
    final fakeSettingsInputTypeNotifier =
        FakeSettingsInputTypeNotifier(inputTypeSwitching);
    final fakeQuizPageNotifier = FakeQuizPageNotifier(
      const QuizPageInfo(
        normalKeyboard: false,
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

    final fakeStatisticsNotifier =
        FakeStatisticsNotifier(const QuizStatistics());

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
          quizInfoProvider(quizType)
              .overrideWith((ref) => fakeQuizInfoNotifier),
          quizPageProvider(quizType)
              .overrideWith((ref) => fakeQuizPageNotifier),
          settingsInputTypeProvider
              .overrideWith((ref) => fakeSettingsInputTypeNotifier),
          wordInputNotifierProvider(quizType)
              .overrideWith((ref) => fakeWordInputNotifier),
          statisticsProvider(quizType)
              .overrideWith((ref) => fakeStatisticsNotifier),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: WordQuizLayout(),
            ),
          ),
        ),
      ),
    );

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
    final mockParentalControl = MockParentalControl();
    when(mockParentalControl.isParentalControl()).thenReturn(false);

    const quizType = QuizTypes.endless;
    final fakeSettingsInputTypeNotifier =
        FakeSettingsInputTypeNotifier(inputTypeSwitching);
    final fakeQuizPageNotifier = FakeQuizPageNotifier(
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

    final fakeStatisticsNotifier =
        FakeStatisticsNotifier(const QuizStatistics());

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
          quizInfoProvider(quizType)
              .overrideWith((ref) => fakeQuizInfoNotifier),
          quizPageProvider(quizType)
              .overrideWith((ref) => fakeQuizPageNotifier),
          settingsInputTypeProvider
              .overrideWith((ref) => fakeSettingsInputTypeNotifier),
          wordInputNotifierProvider(quizType)
              .overrideWith((ref) => fakeWordInputNotifier),
          statisticsProvider(quizType)
              .overrideWith((ref) => fakeStatisticsNotifier),
          parentalControlProvider.overrideWithValue(mockParentalControl),
        ],
        child: const MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: WordQuizLayout(),
            ),
          ),
        ),
      ),
    );

    expect(find.byType(AnswerView), findsOneWidget);
    expect(find.byType(StatisticsView), findsOneWidget);
    expect(find.byType(QuizSelectionView), findsOneWidget);
    expect(find.byType(ResultView), findsOneWidget);
    expect(find.byType(QuizChangedView), findsOneWidget);
  });
}
