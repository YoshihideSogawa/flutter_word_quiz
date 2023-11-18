import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:word_quiz/constant/box_names.dart';
import 'package:word_quiz/model/settings_input_type.dart';
import 'package:word_quiz/repository/hive_box_provider.dart';
import 'package:word_quiz/repository/settings/save_input_type.dart';
import 'package:word_quiz/repository/settings/settings_keys.dart';

import '../../mock/mock_hive_box.dart';

void main() {
  test('saveInputType', () async {
    final box = MockHiveBox(
      initData: {inputTypeKey: InputTypes.all.typeId},
    );

    final container = ProviderContainer(
      overrides: [
        hiveBoxProvider(settingsBoxName).overrideWith((ref) => box),
      ],
    );

    await container.read(saveInputTypeProvider(InputTypes.switching).future);

    expect(box.data[inputTypeKey], InputTypes.switching.typeId);
  });
}
