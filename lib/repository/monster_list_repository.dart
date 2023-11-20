import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:word_quiz/model/monster.dart';

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
}

/// テスト用のMock
@visibleForTesting
class MockMonsterListRepository extends _$MonsterListRepository
    with Mock
    implements MonsterListRepository {}
