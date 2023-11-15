import 'package:word_quiz/model/parental_gate_page_info.dart';
import 'package:word_quiz/provider/parental_gate_page_notifier.dart';

class FakeParentalGatePageNotifier extends MockParentalGatePageNotifier {
  FakeParentalGatePageNotifier({
    this.parentalGatePageInfo,
  });

  final ParentalGatePageInfo? parentalGatePageInfo;

  @override
  ParentalGatePageInfo build() {
    return parentalGatePageInfo ?? super.build();
  }

  @override
  Future<void> updateParentalControl({required bool parentalControl}) async {}
}
