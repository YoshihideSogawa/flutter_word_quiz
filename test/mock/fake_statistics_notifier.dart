import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/quiz_statistics.dart';
import 'package:word_quiz/provider/statistics_provider.dart';

class FakeStatisticsNotifier extends StateNotifier<QuizStatistics>
    implements StatisticsNotifier {
  FakeStatisticsNotifier(super._state);

  bool? nextQuizCalled = false;

  bool finishQuizCalled = false;

  @override
  Future<void> init() async {}

  @override
  Future<void> finishQuiz() async {
    finishQuizCalled = true;
  }

  @override
  Future<void> nextQuiz() async {
    nextQuizCalled = true;
  }

  @override
  Future<void> startQuiz() async {}

  @override
  Future<void> successQuiz() async {}
}
