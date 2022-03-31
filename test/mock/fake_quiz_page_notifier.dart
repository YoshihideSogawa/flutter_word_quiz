import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/quiz_page_info.dart';
import 'package:word_quiz/provider/quiz_page_provider.dart';

class FakeQuizPageNotifier extends StateNotifier<QuizPageInfo>
    implements QuizPageNotifier {
  FakeQuizPageNotifier(QuizPageInfo state) : super(state);

  bool updateKeyboardCalled = false;

  bool showStatisticsCalled = false;

  bool dismissStatisticsCalled = false;

  @override
  void dismissAnswer() {}

  @override
  void dismissQuizChanged() {}

  @override
  void dismissQuizSelection() {}

  @override
  void dismissResult() {}

  @override
  void dismissStatistics() {
    dismissStatisticsCalled = true;
  }

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

  @override
  void updateKeyboard({required bool isNormalKeyboard}) {
    updateKeyboardCalled = true;
  }
}
