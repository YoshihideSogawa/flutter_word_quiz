import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';

FakeUrlLauncher setUpUrlLauncher() {
  final fakeUrlLauncher = FakeUrlLauncher();
  UrlLauncherPlatform.instance = fakeUrlLauncher;
  return fakeUrlLauncher;
}

class FakeUrlLauncher extends Fake
    with MockPlatformInterfaceMixin
    implements UrlLauncherPlatform {
  String? launchUrl;

  bool canLaunchCalled = false;

  bool launchCalled = false;

  @override
  Future<bool> canLaunch(String url) async {
    canLaunchCalled = true;
    return true;
  }

  @override
  Future<bool> launch(
    String url, {
    required bool useSafariVC,
    required bool useWebView,
    required bool enableJavaScript,
    required bool enableDomStorage,
    required bool universalLinksOnly,
    required Map<String, String> headers,
    String? webOnlyWindowName,
  }) async {
    launchUrl = url;
    launchCalled = true;
    return true;
  }
}
