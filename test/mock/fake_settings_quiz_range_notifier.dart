import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/quiz_range.dart';
import 'package:word_quiz/provider/settings_quiz_range_provider.dart';

class FakeSettingsQuizRangeNotifier extends StateNotifier<QuizRange>
    implements SettingsQuizRangeNotifier {
  FakeSettingsQuizRangeNotifier(super.state);

  QuizRange? quizRange;

  @override
  void init() {}

  @override
  void updateQuizRange(QuizRange quizRange) {
    this.quizRange = quizRange;
  }
}
