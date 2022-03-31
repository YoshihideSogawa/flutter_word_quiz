import 'package:word_quiz/model/word_input.dart';
import 'package:word_quiz/model/word_keyboard_state.dart';
import 'package:word_quiz/model/word_name_state.dart';

/// キーボードの状態をチェックします。
Map<String, WordKeyboardState> checkKeyboard(
  List<InputWords?> inputWords,
  List<WordResults?> wordState,
) {
  final result = <String, WordKeyboardState>{};
  for (var i = 0; i < wordState.length; i++) {
    for (var j = 0; j < (wordState[i] ?? []).length; j++) {
      // 想定外のデータの場合
      if (j >= (wordState[i]?.length ?? 0) ||
          j >= (inputWords[i]?.length ?? 0)) {
        continue;
      }

      final targetWord = wordState[i]?[j];
      final inputWord = inputWords[i]?[j];
      if (targetWord == null || inputWord == null) {
        continue;
      }

      // matchの場合はいずれでも上書きしない
      if (result[inputWord] == WordKeyboardState.match) {
        continue;
      }

      switch (targetWord) {
        case WordNameState.none:
          result[inputWord] = WordKeyboardState.none;
          break;
        case WordNameState.hit:
          result[inputWord] = WordKeyboardState.hit;
          break;
        case WordNameState.match:
          result[inputWord] = WordKeyboardState.match;
          break;
        case WordNameState.notMatch:
          // hitの場合はnotMatchで上書きしない
          if (result[inputWord] != WordKeyboardState.hit) {
            result[inputWord] = WordKeyboardState.notMatch;
          }
          break;
      }
    }
  }

  return result;
}
