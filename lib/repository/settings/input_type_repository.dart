import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:word_quiz/constant/box_names.dart';
import 'package:word_quiz/model/settings_input_type.dart';
import 'package:word_quiz/repository/hive_box_provider.dart';
import 'package:word_quiz/repository/settings/settings_keys.dart';

part 'input_type_repository.g.dart';

/// 入力タイプの設定です。
@riverpod
class InputTypeRepository extends _$InputTypeRepository {
  @override
  Future<InputTypes> build() async {
    final settingsBox =
        await ref.watch(hiveBoxProvider(settingsBoxName).future);
    final inputTypeId = settingsBox.get(inputTypeKey) as int?;
    return InputTypes.values
            .firstWhereOrNull((element) => element.typeId == inputTypeId) ??
        InputTypes.switching;
  }

  /// 入力タイプを更新します。
  Future<void> updateInputType(InputTypes inputType) async {
    final settingsBox = await ref.read(hiveBoxProvider(settingsBoxName).future);
    await settingsBox.put(inputTypeKey, inputType.index);
    ref.invalidateSelf();
  }
}
