import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:word_quiz/model/quiz_info.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/model/settings_input_type.dart';
import 'package:word_quiz/model/word_input.dart';
import 'package:word_quiz/provider/quiz_info_provider.dart';
import 'package:word_quiz/provider/settings_input_type_provider.dart';
import 'package:word_quiz/provider/word_input_provider.dart';
import 'package:word_quiz/repository/app_property_repository.dart';
import 'package:word_quiz/ui/quiz/quiz_page.dart';
import 'package:word_quiz/ui/word_quiz.dart';

import '../mock/fake_quiz_info_notifier.dart';
import '../mock/fake_settings_input_type_notifier.dart';
import '../mock/fake_word_input_notifier.dart';
import '../mock/generate_mocks.mocks.dart';

void main() {
  testWidgets('WordQuiz', (tester) async {
    final mockAppPropertyRepository = MockAppPropertyRepository();
    when(mockAppPropertyRepository.alreadyLaunched()).thenReturn(true);
    when(mockAppPropertyRepository.parentalControl()).thenReturn(false);


    final fakeSettingsInputTypeNotifier =
        FakeSettingsInputTypeNotifier(inputTypeSwitching);
    final fakeQuizInfoNotifier =
        FakeQuizInfoNotifier(const AsyncValue.data(QuizInfo()));

    final fakeWordInputNotifier = FakeWordInputNotifier(const WordInput());

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          appPropertyRepositoryProvider
              .overrideWithValue(mockAppPropertyRepository),
          settingsInputTypeProvider
              .overrideWithValue(fakeSettingsInputTypeNotifier),
          //daily
          quizInfoProvider(QuizTypes.daily)
              .overrideWithValue(fakeQuizInfoNotifier),
          wordInputNotifierProvider(QuizTypes.daily)
              .overrideWithValue(fakeWordInputNotifier),
          // endless
          quizInfoProvider(QuizTypes.endless)
              .overrideWithValue(fakeQuizInfoNotifier),
          wordInputNotifierProvider(QuizTypes.endless)
              .overrideWithValue(fakeWordInputNotifier),
        ],
        child: const WordQuiz(),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(QuizPage), findsOneWidget);
  });
}
