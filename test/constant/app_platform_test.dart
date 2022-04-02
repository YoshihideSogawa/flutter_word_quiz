import 'package:flutter_test/flutter_test.dart';
import 'package:word_quiz/constant/app_platform.dart';

void main() {
  test('isIOS', () {
    AppPlatform.overridePlatForm = null;
    expect(AppPlatform.isIOS, isFalse);

    AppPlatform.overridePlatForm = Platforms.iOS;
    expect(AppPlatform.isIOS, isTrue);
  });

  test('isAndroid', () {
    AppPlatform.overridePlatForm = null;
    expect(AppPlatform.isAndroid, isFalse);

    AppPlatform.overridePlatForm = Platforms.android;
    expect(AppPlatform.isAndroid, isTrue);
  });
}
