import 'package:flutter/foundation.dart';
import 'package:word_quiz/model/quiz_info.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/provider/quiz_info_notifier.dart';

class FakeQuizInfoNotifier extends MockQuizInfoNotifier {
  FakeQuizInfoNotifier({
    this.quizInfo,
    this.exception,
  });

  @visibleForTesting
  final QuizInfo? quizInfo;

  @visibleForTesting
  final Exception? exception;

  @override
  Future<QuizInfo> build(QuizTypes quizType) async {
    if (exception != null) {
      throw exception!;
    }

    return quizInfo ?? await super.build(quizType);
  }
}
