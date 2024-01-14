import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/quiz_info.dart';
import 'package:word_quiz/model/quiz_range.dart';
import 'package:word_quiz/provider/quiz_info_provider.dart';

@Deprecated('Delete this class after migration to Riverpod')
class FakeQuizInfoNotifier extends StateNotifier<AsyncValue<QuizInfo>>
    implements QuizInfoNotifier {
  FakeQuizInfoNotifier(
    super._state, {
    this.updateQuizResult = true,
  });

  bool updateQuizCalled = false;

  bool refreshDailyQuizCalled = false;

  bool nextQuizCalled = false;

  bool quitQuizCalled = false;

  bool updateQuizResult;

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
  Future<bool> updateQuiz() async {
    updateQuizCalled = true;
    return updateQuizResult;
  }

  @override
  void updateQuizInfo(QuizInfo quizInfo) {}
}
