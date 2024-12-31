import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/quiz_page_info.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';
import 'package:word_quiz/ui/quiz/component/result_button.dart';

void main() {
  testWidgets('ResultButton', (tester) async {
    final quizPageInfo = ValueNotifier(const QuizPageInfo());
    const quizType = QuizTypes.daily;
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: QuizType(
            quizType: quizType,
            child: Scaffold(
              body: ResultButton(quizPageInfo: quizPageInfo),
            ),
          ),
        ),
      ),
    );

    expect(find.text('けっか'), findsOneWidget);

    await tester.tap(find.byKey(const Key('result_button')));

    expect(quizPageInfo.value.showResult, true);
  });
}
