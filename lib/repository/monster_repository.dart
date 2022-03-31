import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/monster.dart';

/// [Monster]データに関するRepositoryです。
final monsterRepositoryProvider =
    Provider<MonsterRepository>((ref) => _LocalMonsterRepository());

/// [Monster]データのRepositoryです。
/// ignore: one_member_abstracts
abstract class MonsterRepository {
  /// [Monster]データを読み込みます。
  Future<List<Monster>> load();
}

/// [Monster]データのリポジトリ(ローカル)です。
class _LocalMonsterRepository extends MonsterRepository {
  @override
  Future<List<Monster>> load() async {
    final rawJson = await rootBundle.loadString('assets/monsters.json');
    final monsterJson = jsonDecode(rawJson) as List;
    return monsterJson
        .map((dynamic json) => Monster.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
