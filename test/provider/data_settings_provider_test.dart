import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:word_quiz/model/quiz_info.dart';
import 'package:word_quiz/model/quiz_page_info.dart';
import 'package:word_quiz/model/quiz_statistics.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/model/word_input.dart';
import 'package:word_quiz/provider/data_settings_provider.dart';
import 'package:word_quiz/provider/quiz_info_provider.dart';
import 'package:word_quiz/provider/quiz_page_provider.dart';
import 'package:word_quiz/provider/statistics_provider.dart';
import 'package:word_quiz/provider/word_input_provider.dart';
import 'package:word_quiz/repository/quiz_repository.dart';

import '../mock/fake_quiz_info_notifier.dart';
import '../mock/fake_quiz_page_notifier.dart';
import '../mock/fake_statistics_notifier.dart';
import '../mock/fake_word_input_notifier.dart';
import '../mock/generate_mocks.mocks.dart';

void main() {
  test('deleteAll()', () async {
    final mockQuizRepository = MockQuizRepository();
    when(mockQuizRepository.deleteAll()).thenAnswer((_) async => 0);

    final fakeQuizInfoNotifier =
        FakeQuizInfoNotifier(const AsyncValue.data(QuizInfo()));
    final fakeQuizPageNotifier = FakeQuizPageNotifier(const QuizPageInfo());
    final fakeQuizStatisticsNotifier =
        FakeStatisticsNotifier(const QuizStatistics());
    final fakeWordInputNotifier = FakeWordInputNotifier(const WordInput());

    final container = ProviderContainer(
      overrides: [
        quizRepositoryProvider(QuizTypes.daily)
            .overrideWithValue(mockQuizRepository),
        quizInfoProvider(QuizTypes.daily)
            .overrideWithValue(fakeQuizInfoNotifier),
        quizPageProvider(QuizTypes.daily)
            .overrideWithValue(fakeQuizPageNotifier),
        statisticsProvider(QuizTypes.daily)
            .overrideWithValue(fakeQuizStatisticsNotifier),
        wordInputNotifierProvider(QuizTypes.daily)
            .overrideWithValue(fakeWordInputNotifier),
      ],
    );

    final dataSettings = container.read(dataSettingsProvider(QuizTypes.daily));
    await dataSettings.deleteAll();

    verify(mockQuizRepository.deleteAll()).called(1);
  });
}
