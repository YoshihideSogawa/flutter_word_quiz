import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:word_quiz/constant/box_names.dart';
import 'package:word_quiz/repository/app_property/app_property_keys.dart';
import 'package:word_quiz/repository/hive_box_provider.dart';

part 'is_parental_control.g.dart';

/// ペアレンタルコントロールをチェックします。
@riverpod
Future<bool?> isParentalControl(IsParentalControlRef ref) async {
  final appPropertyBox =
      await ref.read(hiveBoxProvider(appPropertyBoxName).future);
  return appPropertyBox.get(parentalControlKey) as bool?;
}
