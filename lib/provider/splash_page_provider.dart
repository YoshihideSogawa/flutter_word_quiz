import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/constant/app_platform.dart';
import 'package:word_quiz/model/splash_page_info.dart';
import 'package:word_quiz/repository/app_property_repository.dart';

/// スプラッシュページの処理を行うProviderです。
final splashPageProvider = StateNotifierProvider.autoDispose<SplashPageNotifier,
    AsyncValue<SplashPageInfo>>(
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
    final appPropertyRepository = _ref.read(appPropertyRepositoryProvider);

    // ペアレンタルコントロールが設定されていない場合
    if (appPropertyRepository.parentalControl() == null) {
      // iOS以外はペアレンタルコントロールをオフ
      if (!AppPlatform.isIOS) {
        await appPropertyRepository.saveParentalControl(parentalControl: false);
      }
    }

    // すでに起動済みの場合はルールを表示しない
    if (appPropertyRepository.alreadyLaunched()) {
      state = const AsyncValue.data(
        SplashPageInfo(),
      );
      return;
    }

    // 起動済みをマーク
    await appPropertyRepository.saveLaunched();

    // ルールを表示する
    state = const AsyncValue.data(
      SplashPageInfo(
        showRule: true,
      ),
    );
  }
}
