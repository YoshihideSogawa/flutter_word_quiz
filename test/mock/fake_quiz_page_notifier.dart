import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/quiz_page_info.dart';
import 'package:word_quiz/provider/quiz_page_provider.dart';

class FakeQuizPageNotifier extends StateNotifier<QuizPageInfo>
    implements QuizPageNotifier {
  FakeQuizPageNotifier(super._state);

  bool updateKeyboardCalled = false;

  bool showStatisticsCalled = false;

  @override
  void showAnswer() {}

  @override
  void showQuizChanged() {}

  @override
  void showQuizSelection() {}

  @override
  void showResult() {}

  @override
  void showStatistics() {
    showStatisticsCalled = true;
  }
}
