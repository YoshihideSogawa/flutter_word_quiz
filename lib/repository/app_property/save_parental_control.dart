import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:word_quiz/repository/app_property/app_property_box.dart';
import 'package:word_quiz/repository/app_property/app_propery_keys.dart';

part 'save_parental_control.g.dart';

/// ペアレンタルコントロールを保存します。
@riverpod
Future<void> saveParentalControl(
  SaveParentalControlRef ref, {
  required bool parentalControl,
}) async {
  final appPropertyBox = ref.read(appPropertyBoxProvider);
  await appPropertyBox.put(parentalControlKey, parentalControl);
}
