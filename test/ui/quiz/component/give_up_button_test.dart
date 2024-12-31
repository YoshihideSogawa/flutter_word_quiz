import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/quiz_page_info.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/ui/quiz/component/give_up_button.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';

import '../../../mock/mock_box_data.dart';

void main() {
  testWidgets('GiveUpButton', (tester) async {
    final quizPageInfo = ValueNotifier(const QuizPageInfo());
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: QuizType(
            quizType: QuizTypes.daily,
            child: Scaffold(
              body: GiveUpButton(quizPageInfo: quizPageInfo),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('おわる'), findsOneWidget);
  });

  testWidgets('GiveUpButton(タップ)', (tester) async {
    final quizPageInfo = ValueNotifier(const QuizPageInfo());
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizOverride(quizType: QuizTypes.daily),
        ],
        child: MaterialApp(
          home: QuizType(
            quizType: QuizTypes.daily,
            child: Scaffold(
              body: GiveUpButton(quizPageInfo: quizPageInfo),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('give_up_button_ink_well')));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('quit_quiz_dialog')), findsOneWidget);

    // はいをタップ
    await tester.tap(find.text('はい'));
    await tester.pumpAndSettle();

    expect(quizPageInfo.value.showResult, isTrue);
  });
}
