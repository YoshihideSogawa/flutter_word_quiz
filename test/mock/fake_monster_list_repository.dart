import 'package:flutter/foundation.dart';
import 'package:word_quiz/model/monster.dart';
import 'package:word_quiz/repository/monster_list_repository.dart';

import 'monster_test_list.dart';

class FakeMonsterListRepository extends MockMonsterListRepository {
  FakeMonsterListRepository({
    this.monsterList,
  });

  @visibleForTesting
  final List<Monster>? monsterList;

  @override
  Future<List<Monster>> build() async {
    return monsterList ?? monsterTestList;
  }
}
