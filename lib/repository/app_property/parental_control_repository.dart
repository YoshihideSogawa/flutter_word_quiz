import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:word_quiz/constant/app_platform.dart';
import 'package:word_quiz/constant/box_names.dart';
import 'package:word_quiz/repository/app_property/app_property_keys.dart';
import 'package:word_quiz/repository/hive_box_provider.dart';

part 'parental_control_repository.g.dart';

/// ペアレンタルコントロールを更新します。
@riverpod
class ParentalControlRepository extends _$ParentalControlRepository {
  @override
  FutureOr<bool> build() async {
    // iOS以外はペアレンタルコントロールをオフ
    if (!AppPlatform.isIOS) {
      return false;
    }

    // iOSのみペアレンタルコントロールを取得
    final appPropertyBox =
        await ref.read(hiveBoxProvider(appPropertyBoxName).future);
    return appPropertyBox.get(parentalControlKey) as bool? ?? true;
  }

  /// ペアレンタルコントロールを保存します。
  Future<void> saveParentalControl({
    required bool parentalControl,
  }) async {
    if (!AppPlatform.isIOS) {
      return;
    }

    final appPropertyBox =
        await ref.read(hiveBoxProvider(appPropertyBoxName).future);
    await appPropertyBox.put(parentalControlKey, parentalControl);
    ref.invalidateSelf();
  }
}
