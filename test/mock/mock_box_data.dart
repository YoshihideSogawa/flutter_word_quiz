import 'package:word_quiz/model/settings_input_type.dart';
import 'package:word_quiz/repository/app_property/app_property_keys.dart';
import 'package:word_quiz/repository/settings/settings_keys.dart';

import 'mock_hive_box.dart';

MockHiveBox<dynamic> appPropertyBox({
  bool? parentalControl,
}) =>
    MockHiveBox<dynamic>(
      initData: {
        parentalControlKey: parentalControl,
      },
    );

MockHiveBox<dynamic> settingsBox({
  InputTypes? inputType,
}) =>
    MockHiveBox<dynamic>(
      initData: {
        inputTypeKey: inputType?.typeId,
      },
    );
