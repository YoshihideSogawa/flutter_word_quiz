import 'package:flutter/material.dart';
import 'package:word_quiz/model/quiz_type.dart';

/// [QuizTypes]を保持します。
class QuizType extends InheritedWidget {
  const QuizType({
    Key? key,
    required this.quizType,
    required Widget child,
  }) : super(
          key: key,
          child: child,
        );

  final QuizTypes quizType;

  /// [QuizTypes]を取得します。
  static QuizType of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<QuizType>();
    assert(result != null, 'No QuizType found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(QuizType oldWidget) => quizType != oldWidget.quizType;
}
