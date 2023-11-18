import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:word_quiz/constant/box_names.dart';
import 'package:word_quiz/model/settings_input_type.dart';
import 'package:word_quiz/repository/hive_box_provider.dart';
import 'package:word_quiz/repository/settings/settings_keys.dart';

part 'fetch_input_type.g.dart';

/// 入力タイプを取得します。
@riverpod
Future<InputTypes?> fetchInputType(FetchInputTypeRef ref) async {
  final settingsBox = await ref.read(hiveBoxProvider(settingsBoxName).future);
  final inputTypeId = settingsBox.get(inputTypeKey) as int?;
  return InputTypes.values
          .firstWhereOrNull((element) => element.typeId == inputTypeId) ??
      InputTypes.switching;
}
