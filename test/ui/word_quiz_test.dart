import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/model/settings_input_type.dart';
import 'package:word_quiz/ui/quiz/quiz_page.dart';
import 'package:word_quiz/ui/word_quiz.dart';

import '../mock/mock_box_data.dart';

void main() {
  testWidgets('WordQuiz', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          appPropertyOverride(
            parentalControl: false,
            alreadyLaunched: true,
          ),
          settingsOverride(inputType: InputTypes.switching),
          quizOverride(quizType: QuizTypes.daily),
          quizOverride(quizType: QuizTypes.endless),
        ],
        child: const WordQuiz(),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(QuizPage), findsOneWidget);
  });
}
