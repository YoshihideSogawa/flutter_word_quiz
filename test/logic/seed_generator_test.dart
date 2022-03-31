import 'package:flutter_test/flutter_test.dart';
import 'package:word_quiz/logic/seed_generator.dart';

void main() {
  test('generateSeed', () {
    final seed = generateSeed('test', 1);
    expect(seed, 685161611657);
  });
}
