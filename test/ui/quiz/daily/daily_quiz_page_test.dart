import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/logic/date_utils.dart';
import 'package:word_quiz/model/monster_series.dart';
import 'package:word_quiz/model/quiz_info.dart';
import 'package:word_quiz/model/quiz_process_type.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/model/settings_input_type.dart';
import 'package:word_quiz/provider/quiz_info_notifier.dart';
import 'package:word_quiz/ui/quiz/component/quiz_changed_view.dart';
import 'package:word_quiz/ui/quiz/component/quiz_drawer.dart';
import 'package:word_quiz/ui/quiz/component/refresh_quiz_button.dart';
import 'package:word_quiz/ui/quiz/component/statistics_button.dart';
import 'package:word_quiz/ui/quiz/component/statistics_view.dart';
import 'package:word_quiz/ui/quiz/component/word_quiz_layout.dart';
import 'package:word_quiz/ui/quiz/daily/daily_quiz_page.dart';

import '../../../mock/fake_quiz_info_notifier.dart';
import '../../../mock/mock_box_data.dart';
import '../../../mock/monster_test_list.dart';

void main() {
  testWidgets('DailyQuizPage(読み込み完了)', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          settingsOverride(inputType: InputTypes.switching),
          quizOverride(quizType: QuizTypes.daily),
        ],
        child: const MaterialApp(
          home: DailyQuizPage(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('きょうのもんだい'), findsOneWidget);
    expect(find.byType(RefreshQuizButton), findsOneWidget);
    expect(find.byType(StatisticsButton), findsOneWidget);
    expect(find.byType(WordQuizLayout), findsOneWidget);

    // ドロワーオープン
    tester.firstState<ScaffoldState>(find.byType(Scaffold)).openDrawer();
    await tester.pumpAndSettle();
    expect(find.byType(QuizDrawer), findsOneWidget);
  });

  testWidgets('DailyQuizPage(Error)', (tester) async {
    final errorNotifier = FakeQuizInfoNotifier(exception: Exception());
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          settingsOverride(inputType: InputTypes.switching),
          quizOverride(quizType: QuizTypes.daily),
          quizInfoNotifierProvider(QuizTypes.daily)
              .overrideWith(() => errorNotifier),
        ],
        child: const MaterialApp(
          home: DailyQuizPage(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(
      find.text('もんだいが おこりました\nアプリを さいきどう してください'),
      findsOneWidget,
    );
  });

  testWidgets('showStatistics', (tester) async {
    final quizInfo = QuizInfo(
      playDate: generateDate(),
      quizProcess: QuizProcessType.success,
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          settingsOverride(inputType: InputTypes.switching),
          quizOverride(quizType: QuizTypes.daily, quizInfo: quizInfo),
        ],
        child: const MaterialApp(
          home: DailyQuizPage(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(StatisticsView), findsOneWidget);
  });

  testWidgets('newDate', (tester) async {
    const quizType = QuizTypes.daily;

    // playDateが古いデータ
    final quizInfo = QuizInfo(
      playDate: generateDate() - 1,
      quizType: quizType,
      quizRange: diamondPearl,
      answer: monsterTestList[0],
      maxAnswer: 10,
      quizProcess: QuizProcessType.started,
    );

    final quizOverrideBox =
        quizOverrideAndBox(quizType: quizType, quizInfo: quizInfo);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          settingsOverride(inputType: InputTypes.switching),
          quizOverrideBox.override,
        ],
        child: const MaterialApp(
          home: DailyQuizPage(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(QuizChangedView), findsOneWidget);
  });
}
