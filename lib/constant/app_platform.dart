import 'dart:io';

import 'package:flutter/cupertino.dart';

/// アプリのPlatform判定を行います。(テスト可能にした)
class AppPlatform {
  /// private constructor
  AppPlatform._(); // coverage:ignore-line

  /// 動作中のPlatformを上書きします。
  @visibleForTesting
  static Platforms? overridePlatForm;

  /// iOSかチェックします。
  static bool get isIOS => overridePlatForm == null
      ? Platform.isIOS
      : overridePlatForm == Platforms.iOS;

  /// Androidかチェックします。
  static bool get isAndroid => overridePlatForm == null
      ? Platform.isAndroid
      : overridePlatForm == Platforms.android;
}

/// 上書きするためのPlatform定数
@visibleForTesting
enum Platforms {
  iOS,
  android,
  others,
}
