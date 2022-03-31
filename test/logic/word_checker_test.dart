import 'package:flutter_test/flutter_test.dart';
import 'package:word_quiz/logic/word_checker.dart';
import 'package:word_quiz/model/quiz_info.dart';
import 'package:word_quiz/model/word_name_state.dart';

import '../mock/monster_test_list.dart';

void main() {
  test('checkWord(モンスターが存在しない)', () {
    final quizInfo = QuizInfo(
      answer: monsterTestList[0],
    );
    final inputWords = ['マ', 'リ', 'ル', 'リ'];
    final result = checkWord(
      monsterTestList,
      quizInfo,
      inputWords,
    );
    expect(result, isNull);
  });

  test('checkWord(完全一致)', () {
    final quizInfo = QuizInfo(
      answer: monsterTestList[0],
    );
    final inputWords = ['フ', 'シ', 'ギ', 'ダ', 'ネ'];
    final result = checkWord(
      monsterTestList,
      quizInfo,
      inputWords,
    );
    expect(
      result,
      [
        WordNameState.match,
        WordNameState.match,
        WordNameState.match,
        WordNameState.match,
        WordNameState.match,
      ],
    );
  });

  test('checkWord(同音に対して完全一致・ヒット数オーバーが混ざるパターン)', () {
    final quizInfo = QuizInfo(
      // レジギガス
      answer: monsterTestList2[1],
    );
    final inputWords = ['ギ', 'ギ', 'ギ', 'ア', 'ル'];
    final result = checkWord(
      monsterTestList2,
      quizInfo,
      inputWords,
    );
    expect(
      result,
      [
        WordNameState.notMatch,
        WordNameState.notMatch,
        WordNameState.match,
        WordNameState.notMatch,
        WordNameState.notMatch,
      ],
    );
  });

  test('checkWord(同音のうち、後方が完全一致になるパターン)', () {
    final quizInfo = QuizInfo(
      // レジギガス
      answer: monsterTestList2[1],
    );
    final inputWords = ['ギ', 'ギ', 'ギ', 'ア', 'ル'];
    final result = checkWord(
      monsterTestList2,
      quizInfo,
      inputWords,
    );
    expect(
      result,
      [
        WordNameState.notMatch,
        WordNameState.notMatch,
        WordNameState.match,
        WordNameState.notMatch,
        WordNameState.notMatch,
      ],
    );
  });

  test('checkWord(同音のうち、前方が完全一致になるパターン)', () {
    final quizInfo = QuizInfo(
      // チコリータ
      answer: monsterTestList2[2],
    );
    final inputWords = ['チ', 'ラ', 'チ', 'ー', 'ノ'];
    final result = checkWord(
      monsterTestList2,
      quizInfo,
      inputWords,
    );
    expect(
      result,
      [
        WordNameState.match,
        WordNameState.notMatch,
        WordNameState.notMatch,
        WordNameState.match,
        WordNameState.notMatch,
      ],
    );
  });

  test('checkWord(同音のうち、片方がヒット、片方が同音オーバーで不一致になるパターン)', () {
    final quizInfo = QuizInfo(
      // サーナイト
      answer: monsterTestList2[4],
    );
    final inputWords = ['フ', 'リ', 'ー', 'ザ', 'ー'];
    final result = checkWord(
      monsterTestList2,
      quizInfo,
      inputWords,
    );
    expect(
      result,
      [
        WordNameState.notMatch,
        WordNameState.notMatch,
        WordNameState.hit,
        WordNameState.notMatch,
        WordNameState.notMatch,
      ],
    );
  });

  test('checkWord(同音かぶりなし)', () {
    final quizInfo = QuizInfo(
      // サーナイト
      answer: monsterTestList2[4],
    );
    final inputWords = ['ド', 'サ', 'イ', 'ド', 'ン'];
    final result = checkWord(
      monsterTestList2,
      quizInfo,
      inputWords,
    );
    expect(
      result,
      [
        WordNameState.notMatch,
        WordNameState.hit,
        WordNameState.hit,
        WordNameState.notMatch,
        WordNameState.notMatch,
      ],
    );
  });
}
