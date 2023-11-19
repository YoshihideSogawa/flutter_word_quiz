import 'package:flutter/foundation.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:word_quiz/model/splash_page_info.dart';
import 'package:word_quiz/repository/app_property/already_launched_repository.dart';

part 'splash_page_notifier.g.dart';

/// スプラッシュページの処理を行います。
@riverpod
class SplashPageNotifier extends _$SplashPageNotifier {
  @override
  Future<SplashPageInfo> build() async {
    // すでに起動済みの場合はルールを表示しない
    if (await ref.watch(alreadyLaunchedRepositoryProvider.future) ?? false) {
      return const SplashPageInfo();
    }

    // 起動済みとする
    await ref
        .watch(alreadyLaunchedRepositoryProvider.notifier)
        .markAsLaunched();

    return const SplashPageInfo(
      showRule: true,
    );
  }
}

/// テスト用のMock
@visibleForTesting
class SplashPageNotifierMock extends _$SplashPageNotifier
    with Mock
    implements SplashPageNotifier {}
