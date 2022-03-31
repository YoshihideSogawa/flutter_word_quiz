import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:word_quiz/model/monster.dart';
import 'package:word_quiz/model/quiz_process_type.dart';
import 'package:word_quiz/model/quiz_range.dart';
import 'package:word_quiz/model/quiz_type.dart';

part 'quiz_info.freezed.dart';
part 'quiz_info.g.dart';

/// クイズの情報です。
@freezed
class QuizInfo with _$QuizInfo {
  const factory QuizInfo({
    Monster? answer,
    @Default(0) int maxAnswer,
    QuizTypes? quizType,
    @Default(QuizProcessType.none) QuizProcessType quizProcess,
    QuizRange? quizRange,
    String? seedText,
    @Default(0) int playDate,
  }) = _QuizInfo;

  factory QuizInfo.fromJson(Map<String, dynamic> json) =>
      _$QuizInfoFromJson(json);
}
