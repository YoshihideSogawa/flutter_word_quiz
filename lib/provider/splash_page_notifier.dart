import 'package:flutter/foundation.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:word_quiz/constant/app_platform.dart';
import 'package:word_quiz/model/splash_page_info.dart';
import 'package:word_quiz/repository/app_property/already_launched_repository.dart';
import 'package:word_quiz/repository/app_property/parental_control_repository.dart';

part 'splash_page_notifier.g.dart';

/// スプラッシュページの処理を行います。
@riverpod
class SplashPageNotifier extends _$SplashPageNotifier {
  @override
  Future<SplashPageInfo> build() async {
    // ペアレンタルコントロールが設定されていない場合
    if (await ref.read(parentalControlRepositoryProvider.future) == null) {
      // iOS以外はペアレンタルコントロールをオフ
      if (!AppPlatform.isIOS) {
        await ref
            .read(parentalControlRepositoryProvider.notifier)
            .saveParentalControl(parentalControl: false);
      }
    }

    // すでに起動済みの場合はルールを表示しない
    if (await ref.read(alreadyLaunchedRepositoryProvider.future) ?? false) {
      return const SplashPageInfo();
    }

    // 起動済みとする
    await ref.read(alreadyLaunchedRepositoryProvider.notifier).markAsLaunched();

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