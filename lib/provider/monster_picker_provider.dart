import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/monster.dart';
import 'package:word_quiz/model/quiz_range.dart';
import 'package:word_quiz/provider/monster_list_provider.dart';

/// モンスター選択のProviderです。
final monsterPickerProvider = Provider<MonsterPicker>(MonsterPicker.new);

/// モンスターを選択を行います。
class MonsterPicker {
  MonsterPicker(this._ref);

  /// [Ref]
  final Ref _ref;

  // TODO(sogawa): 同じモンスターが連続で選出される可能性がある
  /// 回答用のモンスターをピックアップします。
  Future<Monster> pick({
    QuizRange? range,
    int? seed,
  }) async {
    final monsterList = await _ref.read(monsterListProvider.future);

    // NOTE:デバッグコード
    // return monsterList.firstWhere((element) => element.id == 120);

    // 範囲もシードも設定されていない場合はランダムに選出
    if (range == null && seed == null) {
      return monsterList[Random().nextInt(monsterList.length)];
    }

    /// 文字数が5文字で、問題の範囲内にいるモンスターに絞る
    final targetMonsterList = monsterList
        .where(
          (element) => element.name.length == 5 && element.id <= range!.maxNo,
        )
        .toList();

    final pickedNo = Random(seed).nextInt(targetMonsterList.length);
    return targetMonsterList[pickedNo];
  }
}
