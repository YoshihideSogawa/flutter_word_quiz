import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/constant/box_names.dart';
import 'package:word_quiz/repository/app_property/already_launched.dart';
import 'package:word_quiz/repository/app_property/save_launched.dart';

import '../mock/hive_tester.dart';

void main() {
  setUp(() async {
    setUpHive();
    await Hive.openBox<dynamic>(appPropertyBoxName);
  });

  tearDown(tearDownHive);

  test('alreadyLaunched/saveLaunched', () async {
    final container = ProviderContainer();
    final alreadyLaunched =
        await container.read(alreadyLaunchedProvider.future);
    expect(alreadyLaunched, isNull);

    await container.read(saveLaunchedProvider.future);
    container.invalidate(alreadyLaunchedProvider);

    final newAlreadyLaunched =
        await container.read(alreadyLaunchedProvider.future);
    expect(newAlreadyLaunched, isTrue);
  });
}
