import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/quiz_statistics.dart';
import 'package:word_quiz/provider/statistics_provider.dart';

class FakeStatisticsNotifier extends StateNotifier<QuizStatistics>
    implements StatisticsNotifier {
  FakeStatisticsNotifier(QuizStatistics state) : super(state);

  bool? nextQuizCalled = false;

  bool finishQuizCalled = false;

  @override
  void init() {}

  @override
  void finishQuiz() {
    finishQuizCalled = true;
  }

  @override
  void nextQuiz() {
    nextQuizCalled = true;
  }

  @override
  void startQuiz() {}

  @override
  void successQuiz() {}
}
