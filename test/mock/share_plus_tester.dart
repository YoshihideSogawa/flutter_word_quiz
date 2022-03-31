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

  bool shareFilesCalled = false;

  bool shareFilesWithResultCalled = false;

  bool shareWithResultCalled = false;

  @override
  Future<void> share(
    String text, {
    String? subject,
    Rect? sharePositionOrigin,
  }) async {
    shareCalled = true;
  }

  @override
  Future<void> shareFiles(
    List<String> paths, {
    List<String>? mimeTypes,
    String? subject,
    String? text,
    Rect? sharePositionOrigin,
  }) async {
    shareFilesCalled = true;
  }

  @override
  Future<ShareResult> shareFilesWithResult(
    List<String> paths, {
    List<String>? mimeTypes,
    String? subject,
    String? text,
    Rect? sharePositionOrigin,
  }) async {
    shareFilesWithResultCalled = true;
    return const ShareResult('success', ShareResultStatus.success);
  }

  @override
  Future<ShareResult> shareWithResult(
    String text, {
    String? subject,
    Rect? sharePositionOrigin,
  }) async {
    shareWithResultCalled = true;
    return const ShareResult('success', ShareResultStatus.success);
  }
}
