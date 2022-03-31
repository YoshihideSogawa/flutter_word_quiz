import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/provider/settings_input_type_provider.dart';

class FakeSettingsInputTypeNotifier extends StateNotifier<int>
    implements SettingsInputTypeNotifier {
  FakeSettingsInputTypeNotifier(int state) : super(state);

  int? inputType;

  @override
  void init() {}

  @override
  void updateInputType(int value) {
    inputType = value;
  }
}
