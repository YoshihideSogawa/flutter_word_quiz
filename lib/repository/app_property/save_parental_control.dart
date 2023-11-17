import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:word_quiz/constant/box_names.dart';
import 'package:word_quiz/repository/app_property/app_property_keys.dart';
import 'package:word_quiz/repository/hive_box_provider.dart';

part 'save_parental_control.g.dart';

/// ペアレンタルコントロールを保存します。
@riverpod
Future<void> saveParentalControl(
  SaveParentalControlRef ref, {
  required bool parentalControl,
}) async {
  final appPropertyBox =
      await ref.read(hiveBoxProvider(appPropertyBoxName).future);
  await appPropertyBox.put(parentalControlKey, parentalControl);
}
