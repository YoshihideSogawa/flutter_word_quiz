import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/parental_gate_page_info.dart';
import 'package:word_quiz/provider/parental_gate_provider.dart';

class FakeParentalGatePageNotifier extends StateNotifier<ParentalGatePageInfo>
    implements ParentalGatePageNotifier {
  FakeParentalGatePageNotifier(ParentalGatePageInfo state) : super(state);

  int pickCallTimes = 0;

  @override
  void pick() {
    pickCallTimes++;
  }

  @override
  void updateParentalControl({required bool parentalControl}) {}
}
