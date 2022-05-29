import 'package:flutter_test/flutter_test.dart';
import 'package:word_quiz/logic/keyboard_checker.dart';
import 'package:word_quiz/model/word_keyboard_state.dart';
import 'package:word_quiz/model/word_name_state.dart';

void main() {
  test('checkKeyboard(文字の重複なし)', () {
    final inputWords = [
      ['ポ', 'ッ', 'チ', 'ャ', 'マ']
    ];

    final wordState = [
      [
        WordNameState.hit,
        WordNameState.hit,
        WordNameState.notMatch,
        WordNameState.match,
        WordNameState.match,
      ],
    ];

    final result = checkKeyboard(inputWords, wordState);
    expect(result['ポ'], WordKeyboardInfo.hit);
    expect(result['ッ'], WordKeyboardInfo.hit);
    expect(result['チ'], WordKeyboardInfo.notMatch);
    expect(result['ャ'], WordKeyboardInfo.match);
    expect(result['マ'], WordKeyboardInfo.match);
  });

  test('checkKeyboard(matchがnotMatchで上書きされない)', () {
    final inputWords = [
      ['マ', 'リ', 'ル', 'リ']
    ];

    final wordState = [
      [
        WordNameState.hit,
        WordNameState.hit,
        WordNameState.notMatch,
        WordNameState.match,
      ],
    ];

    final result = checkKeyboard(inputWords, wordState);
    expect(result['マ'], WordKeyboardInfo.hit);
    expect(result['リ'], WordKeyboardInfo.match);
    expect(result['ル'], WordKeyboardInfo.notMatch);
  });

  test('checkKeyboard(hitがnotMatchで上書きされない)', () {
    final inputWords = [
      ['ル', 'リ', 'リ']
    ];

    final wordState = [
      [
        WordNameState.notMatch,
        WordNameState.hit,
        WordNameState.notMatch,
      ],
    ];

    final result = checkKeyboard(inputWords, wordState);
    expect(result['ル'], WordKeyboardInfo.notMatch);
    expect(result['リ'], WordKeyboardInfo.hit);
  });

  test('checkKeyboard(通常入力では発生しないケース[WordNameState.none])', () {
    final inputWords = [
      ['テ', 'ス', 'ト']
    ];

    final wordState = [
      [
        WordNameState.none,
        WordNameState.hit,
        WordNameState.notMatch,
      ],
    ];

    final result = checkKeyboard(inputWords, wordState);
    expect(result['テ'], WordKeyboardInfo.none);
    expect(result['ス'], WordKeyboardInfo.hit);
    expect(result['ト'], WordKeyboardInfo.notMatch);
  });

  test('checkKeyboard(リストの長さが異なる場合)', () {
    final inputWords = [
      ['テ', 'ス', 'ト']
    ];

    final inputWords2 = [
      ['テ', 'ス', 'ト', 'あ', 'い']
    ];

    final wordState = [
      [
        WordNameState.none,
        WordNameState.hit,
        WordNameState.notMatch,
        WordNameState.notMatch,
      ],
    ];

    // wordStateが長い場合
    final result = checkKeyboard(inputWords, wordState);
    expect(result['テ'], WordKeyboardInfo.none);
    expect(result['ス'], WordKeyboardInfo.hit);
    expect(result['ト'], WordKeyboardInfo.notMatch);

    // inputWordが長い場合
    final result2 = checkKeyboard(inputWords2, wordState);
    expect(result2['テ'], WordKeyboardInfo.none);
    expect(result2['ス'], WordKeyboardInfo.hit);
    expect(result2['ト'], WordKeyboardInfo.notMatch);
    expect(result2['あ'], WordKeyboardInfo.notMatch);
  });
}
