import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/constant/app_platform.dart';
import 'package:word_quiz/provider/splash_page_notifier.dart';

import '../mock/mock_box_data.dart';

void main() {
  setUp(() {
    AppPlatform.overridePlatForm = null;
  });

  test('showFirstRule(初回起動)', () async {
    final container = ProviderContainer(
      overrides: [
        appPropertyOverride(
          parentalControl: false,
          alreadyLaunched: false,
        ),
      ],
    );

    final splashPageInfo =
        await container.read(splashPageNotifierProvider.future);
    expect(splashPageInfo.showRule, isTrue);
  });

  test('showFirstRule(起動済み)', () async {
    final container = ProviderContainer(
      overrides: [
        appPropertyOverride(
          parentalControl: false,
          alreadyLaunched: true,
        ),
      ],
    );
    final splashPageInfo =
        await container.read(splashPageNotifierProvider.future);
    expect(splashPageInfo.showRule, isFalse);
  });
}
