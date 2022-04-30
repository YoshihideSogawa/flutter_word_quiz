import 'dart:io';

import 'package:flutter/cupertino.dart';

// ignore: avoid_classes_with_only_static_members
/// アプリのPlatform判定を行います。(テスト可能にした)
class AppPlatform {
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
