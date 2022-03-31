import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_page_info.freezed.dart';

part 'quiz_page_info.g.dart';

/// クイズページに関する情報です。
@freezed
class QuizPageInfo with _$QuizPageInfo {
  const factory QuizPageInfo({
    @Default(false) bool showAnswer,
    @Default(false) bool showStatistics,
    @Default(true) bool normalKeyboard,
    @Default(false) bool showQuizSelection,
    @Default(false) bool showResult,
    @Default(false) bool showQuizChanged,
  }) = _QuizPageInfo;

  factory QuizPageInfo.fromJson(Map<String, dynamic> json) =>
      _$QuizPageInfoFromJson(json);
}
