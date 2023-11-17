import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/constant/app_platform.dart';
import 'package:word_quiz/constant/box_names.dart';
import 'package:word_quiz/provider/splash_page_notifier.dart';
import 'package:word_quiz/repository/app_property/app_property_keys.dart';
import 'package:word_quiz/repository/hive_box_provider.dart';

import '../mock/mock_hive_box.dart';

void main() {
  setUp(() {
    AppPlatform.overridePlatForm = null;
  });

  test('showFirstRule(初回起動)', () async {
    final box = MockHiveBox<dynamic>(
      initData: {
        parentalControlKey: false,
        alreadyLaunchedKey: false,
      },
    );
    final container = ProviderContainer(
      overrides: [
        hiveBoxProvider(appPropertyBoxName).overrideWith((provider) => box),
      ],
    );

    final splashPageInfo =
        await container.read(splashPageNotifierProvider.future);
    expect(splashPageInfo.showRule, isTrue);
  });

  test('showFirstRule(起動済み)', () async {
    final box = MockHiveBox<dynamic>(
      initData: {
        parentalControlKey: false,
        alreadyLaunchedKey: true,
      },
    );

    final container = ProviderContainer(
      overrides: [
        hiveBoxProvider(appPropertyBoxName).overrideWith((provider) => box),
      ],
    );
    final splashPageInfo =
        await container.read(splashPageNotifierProvider.future);
    expect(splashPageInfo.showRule, isFalse);
  });

  test('ペアレンタルコントロール(iOS)', () async {
    final box = MockHiveBox<dynamic>(
      initData: {
        parentalControlKey: null,
        alreadyLaunchedKey: false,
      },
    );

    final container = ProviderContainer(
      overrides: [
        hiveBoxProvider(appPropertyBoxName).overrideWith((provider) => box),
      ],
    );
    await container.read(splashPageNotifierProvider.future);
    expect(box.get(parentalControlKey), isFalse);
  });
}
