import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/quiz_page_info.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';
import 'package:word_quiz/ui/quiz/component/refresh_quiz_button.dart';

import '../../../mock/mock_box_data.dart';

void main() {
  testWidgets('RefreshQuizButton', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizOverride(quizType: QuizTypes.daily),
        ],
        child: MaterialApp(
          home: QuizType(
            quizType: QuizTypes.daily,
            child: Scaffold(
              body: RefreshQuizButton(
                quizPageInfo: ValueNotifier<QuizPageInfo>(
                  const QuizPageInfo(),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(Icon), findsOneWidget);
  });

  testWidgets('RefreshQuizButtonのタップ', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizOverride(quizType: QuizTypes.daily),
        ],
        child: MaterialApp(
          home: QuizType(
            quizType: QuizTypes.daily,
            child: Scaffold(
              body: RefreshQuizButton(
                quizPageInfo: ValueNotifier<QuizPageInfo>(
                  const QuizPageInfo(),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.byKey(const Key('refresh_button_icon')));
    await tester.pumpAndSettle();

    expect(find.byType(SnackBar), findsOneWidget);
  });
}
