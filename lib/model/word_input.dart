import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:word_quiz/model/word_keyboard_state.dart';
import 'package:word_quiz/model/word_name_state.dart';

part 'word_input.freezed.dart';
part 'word_input.g.dart';

/// 入力されたデータです。
@freezed
class WordInput with _$WordInput {
  const factory WordInput({
    @Default(<InputWords?>[]) List<InputWords?> wordsList,
    @Default(<WordResults?>[]) List<WordResults?> wordsResultList,
    @Default(<String, WordKeyboardInfo>{})
        Map<String, WordKeyboardInfo> keyResultList,
    @Default(0) int inputIndex,
    @Default(false) bool isWordChecking,
  }) = _WordInput;

  factory WordInput.fromJson(Map<String, dynamic> json) =>
      _$WordInputFromJson(json);
}

/// 1キャラクター分の入力文字
typedef InputWords = List<String>;

/// 1キャラクター分の入力結果
typedef WordResults = List<WordNameState>;
