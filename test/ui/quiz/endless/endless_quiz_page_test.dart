import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/model/settings_input_type.dart';
import 'package:word_quiz/provider/quiz_info_notifier.dart';
import 'package:word_quiz/ui/quiz/component/quiz_drawer.dart';
import 'package:word_quiz/ui/quiz/component/refresh_quiz_button.dart';
import 'package:word_quiz/ui/quiz/component/statistics_button.dart';
import 'package:word_quiz/ui/quiz/component/word_quiz_layout.dart';
import 'package:word_quiz/ui/quiz/endless/endless_quiz_page.dart';

import '../../../mock/fake_quiz_info_notifier.dart';
import '../../../mock/mock_box_data.dart';

void main() {
  testWidgets('EndlessQuizPage(読み込み完了)', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          settingsOverride(inputType: InputTypes.switching),
          quizOverride(quizType: QuizTypes.endless),
        ],
        child: const MaterialApp(
          home: EndlessQuizPage(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('いっぱいやる'), findsAtLeast(1));
    expect(find.byType(RefreshQuizButton), findsNothing);
    expect(find.byType(StatisticsButton), findsOneWidget);
    expect(find.byType(WordQuizLayout), findsOneWidget);

    // ドロワーオープン
    tester.firstState<ScaffoldState>(find.byType(Scaffold)).openDrawer();
    await tester.pumpAndSettle();
    expect(find.byType(QuizDrawer), findsOneWidget);
  });

  testWidgets('EndlessQuizPage(Error)', (tester) async {
    final errorNotifier = FakeQuizInfoNotifier(exception: Exception());

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          settingsOverride(inputType: InputTypes.switching),
          quizOverride(quizType: QuizTypes.endless),
          quizInfoNotifierProvider(QuizTypes.endless)
              .overrideWith(() => errorNotifier),
        ],
        child: const MaterialApp(
          home: EndlessQuizPage(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(
      find.text('もんだいが おこりました\nアプリを さいきどう してください'),
      findsOneWidget,
    );
  });
}
