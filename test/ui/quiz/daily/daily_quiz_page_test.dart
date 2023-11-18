import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/constant/box_names.dart';
import 'package:word_quiz/model/quiz_info.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/model/settings_input_type.dart';
import 'package:word_quiz/model/word_input.dart';
import 'package:word_quiz/provider/quiz_info_provider.dart';
import 'package:word_quiz/provider/word_input_provider.dart';
import 'package:word_quiz/repository/hive_box_provider.dart';
import 'package:word_quiz/ui/quiz/component/quiz_drawer.dart';
import 'package:word_quiz/ui/quiz/component/refresh_quiz_button.dart';
import 'package:word_quiz/ui/quiz/component/statistics_button.dart';
import 'package:word_quiz/ui/quiz/component/word_quiz_layout.dart';
import 'package:word_quiz/ui/quiz/daily/daily_quiz_page.dart';

import '../../../mock/fake_quiz_info_notifier.dart';
import '../../../mock/fake_word_input_notifier.dart';
import '../../../mock/mock_box_data.dart';

void main() {
  testWidgets('DailyQuizPage(読み込み完了)', (tester) async {
    final fakeWordInputNotifier = FakeWordInputNotifier(const WordInput());

    final fakeQuizInfoNotifier = FakeQuizInfoNotifier(
      const AsyncValue.data(
        QuizInfo(),
      ),
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          hiveBoxProvider(settingsBoxName).overrideWith(
            (ref) => settingsBox(inputType: InputTypes.switching),
          ),
          quizInfoProvider(QuizTypes.daily)
              .overrideWith((ref) => fakeQuizInfoNotifier),
          wordInputNotifierProvider(QuizTypes.daily)
              .overrideWith((ref) => fakeWordInputNotifier),
        ],
        child: const MaterialApp(
          home: DailyQuizPage(),
        ),
      ),
    );

    expect(find.text('きょうのもんだい'), findsOneWidget);
    expect(find.byType(RefreshQuizButton), findsOneWidget);
    expect(find.byType(StatisticsButton), findsOneWidget);
    expect(find.byType(WordQuizLayout), findsOneWidget);

    // ドロワーオープン
    tester.firstState<ScaffoldState>(find.byType(Scaffold)).openDrawer();
    await tester.pumpAndSettle();
    expect(find.byType(QuizDrawer), findsOneWidget);
  });

  testWidgets('DailyQuizPage(Loading)', (tester) async {
    final fakeQuizInfoNotifier =
        FakeQuizInfoNotifier(const AsyncValue.loading());

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizInfoProvider(QuizTypes.daily)
              .overrideWith((ref) => fakeQuizInfoNotifier),
        ],
        child: const MaterialApp(
          home: DailyQuizPage(),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('DailyQuizPage(Error)', (tester) async {
    final fakeQuizInfoNotifier =
        FakeQuizInfoNotifier(const AsyncValue.error('', StackTrace.empty));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizInfoProvider(QuizTypes.daily)
              .overrideWith((ref) => fakeQuizInfoNotifier),
        ],
        child: const MaterialApp(
          home: DailyQuizPage(),
        ),
      ),
    );

    expect(
      find.text('もんだいが おこりました\nアプリを さいきどう してください'),
      findsOneWidget,
    );
  });
}
