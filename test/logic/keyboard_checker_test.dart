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
    expect(result['ポ'], WordKeyboardState.hit);
    expect(result['ッ'], WordKeyboardState.hit);
    expect(result['チ'], WordKeyboardState.notMatch);
    expect(result['ャ'], WordKeyboardState.match);
    expect(result['マ'], WordKeyboardState.match);
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
    expect(result['マ'], WordKeyboardState.hit);
    expect(result['リ'], WordKeyboardState.match);
    expect(result['ル'], WordKeyboardState.notMatch);
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
    expect(result['ル'], WordKeyboardState.notMatch);
    expect(result['リ'], WordKeyboardState.hit);
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
    expect(result['テ'], WordKeyboardState.none);
    expect(result['ス'], WordKeyboardState.hit);
    expect(result['ト'], WordKeyboardState.notMatch);
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
    expect(result['テ'], WordKeyboardState.none);
    expect(result['ス'], WordKeyboardState.hit);
    expect(result['ト'], WordKeyboardState.notMatch);

    // inputWordが長い場合
    final result2 = checkKeyboard(inputWords2, wordState);
    expect(result2['テ'], WordKeyboardState.none);
    expect(result2['ス'], WordKeyboardState.hit);
    expect(result2['ト'], WordKeyboardState.notMatch);
    expect(result2['あ'], WordKeyboardState.notMatch);
  });
}
