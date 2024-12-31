import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:share_plus_platform_interface/share_plus_platform_interface.dart';

FakeSharePlus setUpSharePlus() {
  final fakeSharePlus = FakeSharePlus();
  SharePlatform.instance = fakeSharePlus;
  return fakeSharePlus;
}

class FakeSharePlus extends Fake
    with MockPlatformInterfaceMixin
    implements SharePlatform {
  bool shareCalled = false;

  @override
  Future<ShareResult> share(
    String text, {
    String? subject,
    Rect? sharePositionOrigin,
  }) async {
    shareCalled = true;
    return const ShareResult('success', ShareResultStatus.success);
  }
}
