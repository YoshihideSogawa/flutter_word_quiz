import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:word_quiz/constant/box_names.dart';
import 'package:word_quiz/repository/app_property/app_property_keys.dart';
import 'package:word_quiz/repository/hive_box_provider.dart';

part 'save_launched.g.dart';

/// 起動済みであることを保存します。
@riverpod
Future<void> saveLaunched(SaveLaunchedRef ref) async {
  final appPropertyBox =
      await ref.read(hiveBoxProvider(appPropertyBoxName).future);
  await appPropertyBox.put(alreadyLaunchedKey, true);
}
