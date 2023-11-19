import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/quiz_info.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/model/settings_input_type.dart';
import 'package:word_quiz/model/word_input.dart';
import 'package:word_quiz/provider/quiz_info_provider.dart';
import 'package:word_quiz/provider/word_input_provider.dart';
import 'package:word_quiz/ui/quiz/quiz_page.dart';
import 'package:word_quiz/ui/word_quiz.dart';

import '../mock/fake_quiz_info_notifier.dart';
import '../mock/fake_word_input_notifier.dart';
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
          //daily
          quizInfoProvider(QuizTypes.daily).overrideWith(
            (ref) => FakeQuizInfoNotifier(const AsyncValue.data(QuizInfo())),
          ),
          wordInputNotifierProvider(QuizTypes.daily)
              .overrideWith((ref) => FakeWordInputNotifier(const WordInput())),
          // endless
          quizInfoProvider(QuizTypes.endless).overrideWith(
            (ref) => FakeQuizInfoNotifier(const AsyncValue.data(QuizInfo())),
          ),
          wordInputNotifierProvider(QuizTypes.endless)
              .overrideWith((ref) => FakeWordInputNotifier(const WordInput())),
        ],
        child: const WordQuiz(),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(QuizPage), findsOneWidget);
  });
}
