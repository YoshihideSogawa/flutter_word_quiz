import 'package:flutter_test/flutter_test.dart';
import 'package:word_quiz/logic/date_utils.dart';

void main() {
  test('generateDate', () {
    final date = generateDate();
    final now = DateTime.now();
    expect(
      date.toString(),
      '${now.year}${now.month.toString().padLeft(2, '0')}'
      '${now.day.toString().padLeft(2, '0')}',
    );
  });

  test('parseDateText', () {
    final dateText = parseDateText(20220202);
    expect(dateText, '02/02');
  });

  test('parseDateTextが8桁以外の場合', () {
    final dateText = parseDateText(202202020);
    expect(dateText, isNull);
  });

  test('parseRemainingTimeText', () {
    final remainingText = parseRemainingTimeText();
    expect(remainingText.length, 8);
  });
}
