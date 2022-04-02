import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/constant/box_names.dart';
import 'package:word_quiz/repository/app_property_repository.dart';

import '../mock/hive_tester.dart';

void main() {
  setUp(() async {
    setUpHive();
    await Hive.openBox<dynamic>(appPropertyBoxName);
  });

  tearDown(tearDownHive);

  test('alreadyLaunched/saveLaunched', () async {
    final container = ProviderContainer();
    final appPropertyRepository = container.read(appPropertyRepositoryProvider);
    expect(appPropertyRepository.alreadyLaunched(), isFalse);

    await appPropertyRepository.saveLaunched();
    expect(appPropertyRepository.alreadyLaunched(), isTrue);
  });

  test('parentalControl/saveParentalControl', () async {
    final container = ProviderContainer();
    final appPropertyRepository = container.read(appPropertyRepositoryProvider);
    expect(appPropertyRepository.parentalControl(), isNull);

    await appPropertyRepository.saveParentalControl(parentalControl: true);
    expect(appPropertyRepository.parentalControl(), isTrue);

    await appPropertyRepository.saveParentalControl(parentalControl: false);
    expect(appPropertyRepository.parentalControl(), isFalse);
  });
}
