import 'package:word_quiz/constant/box_names.dart';

/// 問題形式
enum QuizTypes {
  /// きょうのもんだい
  daily,

  /// いっぱいやる
  endless,
}

extension QuizTypesBoxName on QuizTypes {
  /// Box名を取得します。
  String get boxName => switch (this) {
        QuizTypes.daily => dailyBoxName,
        QuizTypes.endless => endlessBoxName,
      };
}
