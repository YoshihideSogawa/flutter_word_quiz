import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/constant/app_platform.dart';
import 'package:word_quiz/constant/box_names.dart';
import 'package:word_quiz/provider/splash_page_notifier.dart';
import 'package:word_quiz/repository/app_property/app_property_keys.dart';

import '../mock/hive_tester.dart';

void main() {
  setUp(() {
    AppPlatform.overridePlatForm = null;
    setUpHive();
  });

  tearDown(tearDownHive);

  test('showFirstRule(初回起動)', () async {
    await putHiveValues(appPropertyBoxName, {
      parentalControlKey: false,
      alreadyLaunchedKey: false,
    });

    final container = ProviderContainer();

    final splashPageInfo =
        await container.read(splashPageNotifierProvider.future);
    expect(splashPageInfo.showRule, isTrue);
  });

  test('showFirstRule(起動済み)', () async {
    await putHiveValues(appPropertyBoxName, {
      parentalControlKey: false,
      alreadyLaunchedKey: true,
    });

    final container = ProviderContainer();
    final splashPageInfo =
        await container.read(splashPageNotifierProvider.future);
    expect(splashPageInfo.showRule, isFalse);
  });
}
