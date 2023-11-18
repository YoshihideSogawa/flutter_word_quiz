import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/constant/box_names.dart';
import 'package:word_quiz/repository/settings_repository.dart';

import '../mock/hive_tester.dart';

void main() {
  setUp(() async {
    setUpHive();
    await Hive.openBox<dynamic>(settingsBoxName);
  });

  tearDown(tearDownHive);

  test('quizRangeId(save/load)', () async {
    final container = ProviderContainer();
    final settingsRepository = container.read(settingsRepositoryProvider);
    await settingsRepository.saveQuizRangeId(1);

    final rangeId = settingsRepository.quizRangeId();
    expect(rangeId, 1);
  });
}
