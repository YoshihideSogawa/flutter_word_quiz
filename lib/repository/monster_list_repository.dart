import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:word_quiz/model/monster.dart';
import 'package:word_quiz/model/quiz_range.dart';

part 'monster_list_repository.g.dart';

/// [Monster]データに関するRepositoryです。
@Riverpod(keepAlive: true)
class MonsterListRepository extends _$MonsterListRepository {
  @override
  Future<List<Monster>> build() async {
    final rawJson = await rootBundle.loadString('assets/monsters.json');
    final monsterJson = jsonDecode(rawJson) as List;
    return monsterJson
        .map((dynamic json) => Monster.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  /// モンスター選択を行います。
  // TODO(sogawa): 同じモンスターが連続で選出される可能性がある
  Future<Monster> pick({
    QuizRange? range,
    int? seed,
  }) async {
    // buildの完了を待つ
    final monsterList = await future;

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

/// テスト用のMock
@visibleForTesting
class MockMonsterListRepository extends _$MonsterListRepository
    with Mock
    implements MonsterListRepository {}
