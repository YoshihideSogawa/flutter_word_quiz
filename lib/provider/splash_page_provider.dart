import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/splash_page_info.dart';
import 'package:word_quiz/repository/app_property_repository.dart';

/// スプラッシュページの処理を行うProviderです。
final splashPageProvider =
    StateNotifierProvider<SplashPageNotifier, AsyncValue<SplashPageInfo>>(
  SplashPageNotifier.new,
);

/// スプラッシュページの処理を行います。
class SplashPageNotifier extends StateNotifier<AsyncValue<SplashPageInfo>> {
  SplashPageNotifier(
    this._ref,
  ) : super(const AsyncValue.loading()) {
    init();
  }

  /// [Ref]
  final Ref _ref;

  /// 初期化を行います。
  @visibleForTesting
  Future<void> init() async {
    // すでに起動済みの場合はルールを表示しない
    if (_ref.read(appPropertyRepositoryProvider).alreadyLaunched()) {
      state = const AsyncValue.data(
        SplashPageInfo(
          showRule: false,
        ),
      );
      return;
    }

    // 起動済みをマーク
    await _ref.watch(appPropertyRepositoryProvider).saveLaunched();

    // ルールを表示する
    state = const AsyncValue.data(
      SplashPageInfo(
        showRule: true,
      ),
    );
  }
}
