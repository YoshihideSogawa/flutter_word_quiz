import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/quiz_page_info.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/ui/quiz/component/quiz_changed_view.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';

void main() {
  testWidgets('QuizChallengeView', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: QuizType(
            quizType: QuizTypes.daily,
            child: Scaffold(
              body: QuizChangedView(
                quizPageInfo: ValueNotifier(const QuizPageInfo()),
              ),
            ),
          ),
        ),
      ),
    );

    expect(find.text('もんだいが こうしんされました'), findsOneWidget);
  });

  testWidgets('QuizChallengeView', (tester) async {
    final quizPageInfo = ValueNotifier(const QuizPageInfo());

    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: QuizType(
            quizType: QuizTypes.daily,
            child: Scaffold(
              body: QuizChangedView(
                quizPageInfo: quizPageInfo,
              ),
            ),
          ),
        ),
      ),
    );

    await tester.tapAt(Offset.zero);
    expect(quizPageInfo.value.showQuizChanged, isFalse);

    await tester.tap(find.text('とじる'));
    expect(quizPageInfo.value.showQuizChanged, isFalse);
  });
}
