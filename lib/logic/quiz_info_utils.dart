import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_quiz/logic/date_utils.dart';
import 'package:word_quiz/model/quiz_info.dart';

/// [QuizInfo]の拡張クラスです。
extension QuizInfoExtension on AsyncValue<QuizInfo> {
  /// 問題が変わっているかをチェックします。
  bool get playDateChanged => valueOrNull?.playDate != generateDate();
}
