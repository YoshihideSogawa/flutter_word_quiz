import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/logic/date_utils.dart';
import 'package:word_quiz/model/quiz_info.dart';
import 'package:word_quiz/model/quiz_page_info.dart';
import 'package:word_quiz/model/quiz_process_type.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';
import 'package:word_quiz/ui/quiz/component/retire_button.dart';

import '../../../mock/mock_box_data.dart';
import '../../../mock/monster_test_list.dart';

void main() {
  testWidgets('RetireButton', (tester) async {
    const quizType = QuizTypes.daily;
    final quizPageInfo = ValueNotifier(const QuizPageInfo());
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: RetireButton(quizPageInfo: quizPageInfo),
            ),
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.flag_outlined), findsOneWidget);
  });

  testWidgets('RetireButton(Tap)', (tester) async {
    const quizType = QuizTypes.daily;
    final quizPageInfo = ValueNotifier(const QuizPageInfo());
    final quizInfo = QuizInfo(
      answer: monsterTestList[0],
      quizType: quizType,
      quizProcess: QuizProcessType.started,
      playDate: generateDate(),
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizOverride(quizType: quizType, quizInfo: quizInfo),
        ],
        child: MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: RetireButton(quizPageInfo: quizPageInfo),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('retire_button')));
    await tester.pumpAndSettle();
    expect(find.text('あきらめますか？'), findsOneWidget);
    await tester.tap(find.text('はい'));
    await tester.pumpAndSettle(const Duration(seconds: 5));

    // print(quizPageInfo.value);
    expect(quizPageInfo.value.showStatistics, isTrue);
  });

  testWidgets('RetireButton(Tap)', (tester) async {
    const quizType = QuizTypes.endless;
    final quizPageInfo = ValueNotifier(const QuizPageInfo());
    final quizInfo = QuizInfo(
      answer: monsterTestList[0],
      quizType: quizType,
      quizProcess: QuizProcessType.started,
      playDate: generateDate(),
    );
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizOverride(quizType: quizType, quizInfo: quizInfo),
        ],
        child: MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: RetireButton(quizPageInfo: quizPageInfo),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('retire_button')));
    await tester.pumpAndSettle();
    expect(find.text('あきらめますか？'), findsOneWidget);
    await tester.tap(find.text('はい'));
    await tester.pumpAndSettle(const Duration(seconds: 5));

    expect(quizPageInfo.value.showResult, isTrue);
  });
}
