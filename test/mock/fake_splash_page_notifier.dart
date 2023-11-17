import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:word_quiz/model/splash_page_info.dart';
import 'package:word_quiz/provider/splash_page_notifier.dart';

class FakeSplashPageNotifier extends SplashPageNotifierMock {
  FakeSplashPageNotifier({
    this.splashPageInfo,
    this.exception,
  });

  @visibleForTesting
  final SplashPageInfo? splashPageInfo;

  @visibleForTesting
  final Exception? exception;

  @override
  Future<SplashPageInfo> build() async {
    if (exception != null) {
      throw Exception();
    }

    return splashPageInfo ?? await super.build();
  }
}
