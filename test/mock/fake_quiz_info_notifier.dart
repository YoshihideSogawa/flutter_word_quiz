import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/quiz_info.dart';
import 'package:word_quiz/model/quiz_range.dart';
import 'package:word_quiz/provider/quiz_info_provider.dart';

class FakeQuizInfoNotifier extends StateNotifier<AsyncValue<QuizInfo>>
    implements QuizInfoNotifier {
  FakeQuizInfoNotifier(super.state);

  bool updateQuizCalled = false;

  bool refreshDailyQuizCalled = false;

  bool nextQuizCalled = false;

  bool quitQuizCalled = false;

  @override
  Future<void> init() async {}

  @override
  Future<void> nextQuiz() async {
    nextQuizCalled = true;
  }

  @override
  Future<void> quitQuiz() async {
    quitQuizCalled = true;
  }

  @override
  Future<bool> refreshDailyQuiz() async {
    refreshDailyQuizCalled = true;
    return true;
  }

  @override
  Future<void> retireQuiz() async {}

  @override
  Future<void> startQuiz(String seedText, QuizRange quizRange) async {}

  @override
  Future<void> updateQuiz() async {
    updateQuizCalled = true;
  }

  @override
  void updateQuizInfo(QuizInfo quizInfo) {}
}
