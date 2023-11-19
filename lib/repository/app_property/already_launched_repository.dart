import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:word_quiz/constant/box_names.dart';
import 'package:word_quiz/repository/app_property/app_property_keys.dart';
import 'package:word_quiz/repository/hive_box_provider.dart';

part 'already_launched_repository.g.dart';

/// アプリが1度でも起動済みか取得します。
@riverpod
class AlreadyLaunchedRepository extends _$AlreadyLaunchedRepository {
  @override
  Future<bool?> build() async {
    final appPropertyBox =
        await ref.watch(hiveBoxProvider(appPropertyBoxName).future);
    return appPropertyBox.get(alreadyLaunchedKey) as bool?;
  }

  /// 起動済みとして保存します。
  Future<void> markAsLaunched() async {
    final appPropertyBox =
        await ref.read(hiveBoxProvider(appPropertyBoxName).future);
    await appPropertyBox.put(alreadyLaunchedKey, true);
  }
}
