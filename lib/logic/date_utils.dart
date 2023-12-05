import 'package:clock/clock.dart';
import 'package:word_quiz/logic/filled_zero.dart';

/// yyyyMMddの値を生成します。
int generateDate() {
  final now = DateTime.now();
  return now.year * 10000 + now.month * 100 + now.day;
}

/// 20220202を02/02 の形式に変換します。
String? parseDateText(int date) {
  final dateText = date.toString();
  if (dateText.length != 8) {
    return null;
  }
  return '${dateText.substring(4, 6)}/${dateText.substring(6, 8)}';
}

/// 残り時間のテキストを取得します。
String parseRemainingTimeText() {
  final now = clock.now();
  final tomorrow = DateTime(now.year, now.month, now.day + 1);
  final diff = tomorrow.millisecondsSinceEpoch - now.millisecondsSinceEpoch;
  final hour = (diff ~/ Duration.millisecondsPerHour).remainder(60);
  final minutes = (diff ~/ Duration.millisecondsPerMinute).remainder(60);
  final seconds = (diff ~/ Duration.millisecondsPerSecond).remainder(60);

  return '${hour.zeroFill(2)}:'
      '${minutes.zeroFill(2)}:'
      '${seconds.zeroFill(2)}';
}
