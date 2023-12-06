import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/quiz_page_info.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';
import 'package:word_quiz/ui/quiz/component/restart_button.dart';

void main() {
  testWidgets('RestartButton', (tester) async {
    final quizPageInfo = ValueNotifier(const QuizPageInfo());
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: QuizType(
            quizType: QuizTypes.daily,
            child: Scaffold(
              body: RestartButton(quizPageInfo: quizPageInfo),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('はじめる'), findsOneWidget);
  });

  testWidgets('RestartButton Tap', (tester) async {
    final quizPageInfo = ValueNotifier(const QuizPageInfo());

    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: QuizType(
            quizType: QuizTypes.daily,
            child: Scaffold(
              body: RestartButton(quizPageInfo: quizPageInfo),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('restart_button_ink_well')));

    await tester.pumpAndSettle();

    expect(quizPageInfo.value.showQuizSelection, isTrue);
  });
}
