import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:word_quiz/provider/monster_list_provider.dart';
import 'package:word_quiz/repository/monster_repository.dart';

import '../mock/generate_mocks.mocks.dart';
import '../mock/monster_test_list.dart';

void main() {
  test('monsterListProvider', () async {
    final mockMonsterRepository = MockMonsterRepository();
    when(mockMonsterRepository.load()).thenAnswer((_) async => monsterTestList);
    final container = ProviderContainer(
      overrides: [
        monsterRepositoryProvider.overrideWithValue(mockMonsterRepository),
      ],
    );
    final monsterList = await container.read(monsterListProvider.future);

    expect(monsterList.length, 50);
  });
}
