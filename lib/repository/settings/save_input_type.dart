import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:word_quiz/constant/box_names.dart';
import 'package:word_quiz/model/settings_input_type.dart';
import 'package:word_quiz/repository/hive_box_provider.dart';
import 'package:word_quiz/repository/settings/settings_keys.dart';

part 'save_input_type.g.dart';

/// 入力タイプを保存します。
@riverpod
Future<void> saveInputType(SaveInputTypeRef ref, InputTypes inputType) async {
  final settingsBox = await ref.read(hiveBoxProvider(settingsBoxName).future);
  await settingsBox.put(inputTypeKey, inputType.index);

}
