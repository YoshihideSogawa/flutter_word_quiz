import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:word_quiz/repository/app_property/app_property_box.dart';
import 'package:word_quiz/repository/app_property/app_property_keys.dart';

part 'is_parental_control.g.dart';

/// ペアレンタルコントロールをチェックします。
@riverpod
Future<bool?> isParentalControl(IsParentalControlRef ref) async {
  final appPropertyBox = ref.read(appPropertyBoxProvider);
  return appPropertyBox.get(parentalControlKey) as bool?;
}
