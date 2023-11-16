import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:word_quiz/repository/app_property/app_property_box.dart';
import 'package:word_quiz/repository/app_property/app_property_keys.dart';

part 'save_launched.g.dart';

/// 起動済みであることを保存します。
@riverpod
Future<void> saveLaunched(SaveLaunchedRef ref) async {
  final appPropertyBox = ref.read(appPropertyBoxProvider);
  await appPropertyBox.put(alreadyLaunchedKey, true);
}
