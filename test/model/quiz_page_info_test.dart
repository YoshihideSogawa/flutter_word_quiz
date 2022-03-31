import 'package:flutter_test/flutter_test.dart';
import 'package:word_quiz/model/quiz_page_info.dart';

void main() {
  test('QuizPageInfo(fromJson)', () {
    final json = <String, dynamic>{
      'showAnswer': true,
      'showStatistics': true,
      'normalKeyboard': true,
      'showQuizSelection': true,
      'showResult': true,
      'showQuizChanged': true,
    };

    final quizPageInfo = QuizPageInfo.fromJson(json);
    expect(quizPageInfo.showAnswer, isTrue);
    expect(quizPageInfo.showStatistics, isTrue);
    expect(quizPageInfo.normalKeyboard, isTrue);
    expect(quizPageInfo.showQuizSelection, isTrue);
    expect(quizPageInfo.showResult, isTrue);
    expect(quizPageInfo.showQuizChanged, isTrue);
  });
}
