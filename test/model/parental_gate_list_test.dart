import 'package:flutter_test/flutter_test.dart';
import 'package:word_quiz/model/parental_gate_list.dart';

void main() {
  test('parentalGateList', () {
    expect(parentalGateList.length, 10);
  });
}
