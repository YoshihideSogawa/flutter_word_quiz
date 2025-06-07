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
  var _shareCalled = false;

  bool get shareCalled => _shareCalled;

  @override
  Future<ShareResult> share(ShareParams params) async {
    _shareCalled = true;
    return const ShareResult('success', ShareResultStatus.success);
  }
}
