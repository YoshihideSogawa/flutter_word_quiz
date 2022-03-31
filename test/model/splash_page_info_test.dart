import 'package:flutter_test/flutter_test.dart';
import 'package:word_quiz/model/splash_page_info.dart';

void main() {
  test('SplashPageInfo(fromJson)', () {
    final json = <String, dynamic>{
      'showRule': true,
    };

    final quizPageInfo = SplashPageInfo.fromJson(json);
    expect(quizPageInfo.showRule, isTrue);
  });
}
