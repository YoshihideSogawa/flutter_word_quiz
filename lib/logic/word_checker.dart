import 'package:word_quiz/model/monster.dart';
import 'package:word_quiz/model/quiz_info.dart';
import 'package:word_quiz/model/word_input.dart';
import 'package:word_quiz/model/word_name_state.dart';

/// 入力された内容をチェックします。
WordResults? checkWord(
  List<Monster> monsterList,
  QuizInfo quizInfo,
  InputWords inputWords,
) {
  final index =
      monsterList.indexWhere((element) => element.name == inputWords.join());
  // 入力したモンスターが存在しなければ終了
  if (index < 0) {
    return null;
  }

  final result = WordResults.filled(5, WordNameState.none);

  // 1文字ずつ分解
  final answerWords = quizInfo.answer?.name.split('') ?? <String>[];

  // 完全一致から検索
  // 例：Answer:レジギガス > Input:ギギギアル
  for (var i = 0; i < inputWords.length; i++) {
    if (inputWords[i] == answerWords[i]) {
      result[i] = WordNameState.match;
      continue;
    }
    // ヒット以下は一旦noneをセット
    result[i] = WordNameState.none;
  }

  // ヒットを検索
  for (var i = 0; i < inputWords.length; i++) {
    // matchはスキップ
    if (result[i] == WordNameState.match) {
      continue;
    }

    // ヒット候補検索
    for (var j = 0; j < answerWords.length; j++) {
      final targetText = inputWords[i];
      // ヒットする可能性がある場合(重複文字考慮)
      if (targetText == answerWords[j]) {
        final inputDup =
            inputWords.where((element) => element == targetText).length;
        final answerDup =
            answerWords.where((element) => element == targetText).length;
        // 入力の重複文字数が回答の重複文字数以内までの場合
        // ほとんどの場合、入力に文字かぶりがないパターン
        if (inputDup <= answerDup) {
          result[i] = WordNameState.hit;
          break;
        }

        // この文字が重複する文字のうち何番目かをチェック
        var dupIndex = 0;
        for (var k = 0; k < i; k++) {
          if (targetText == inputWords[k]) {
            dupIndex++;
          }
        }

        var dupMatch = 0;
        // 例：Answer:チコリータ > Input:チラチーノ考慮
        // 重複番目に加算するためのdupMatchを計算(matchを優先するため)
        for (var m = 0; m < result.length; m++) {
          // matchで文字列が一致する場合
          if (result[m] == WordNameState.match && targetText == inputWords[m]) {
            dupMatch++;
          }
        }

        // 例：Answer:エーフィ > Input:フリーザー
        // 回答の重複文字数より小さければヒット(先駆け一致文字)
        if (dupIndex + dupMatch < answerDup) {
          result[i] = WordNameState.hit;
          break;
        }
      }

      // 最後までいずれも一致しない場合
      if (j == answerWords.length - 1) {
        result[i] = WordNameState.notMatch;
      }
    }
  }

  return result;
}
