import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:word_quiz/constant/app_platform.dart';
import 'package:word_quiz/model/splash_page_info.dart';
import 'package:word_quiz/repository/app_property/already_launched.dart';
import 'package:word_quiz/repository/app_property/is_parental_control.dart';
import 'package:word_quiz/repository/app_property/save_launched.dart';
import 'package:word_quiz/repository/app_property/save_parental_control.dart';

part 'splash_page_notifier.g.dart';

/// スプラッシュページの処理を行います。
@riverpod
class SplashPageNotifier extends _$SplashPageNotifier {
  @override
  Future<SplashPageInfo> build() async {
    // ペアレンタルコントロールが設定されていない場合
    if (await ref.read(isParentalControlProvider.future) == null) {
      // iOS以外はペアレンタルコントロールをオフ
      if (!AppPlatform.isIOS) {
        await ref
            .read(saveParentalControlProvider(parentalControl: false).future);
      }
    }

    // すでに起動済みの場合はルールを表示しない
    if (await ref.read(alreadyLaunchedProvider.future) ?? false) {
      return const SplashPageInfo();
    }

    // 起動済みをマーク
    await ref.read(saveLaunchedProvider.future);

    return const SplashPageInfo(
      showRule: true,
    );
  }
}
