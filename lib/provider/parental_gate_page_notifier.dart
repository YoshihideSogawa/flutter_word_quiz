import 'package:flutter/foundation.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:word_quiz/model/parental_gate_list.dart';
import 'package:word_quiz/model/parental_gate_page_info.dart';
import 'package:word_quiz/repository/app_property/is_parental_control.dart';
import 'package:word_quiz/repository/app_property/save_parental_control.dart';

part 'parental_gate_page_notifier.g.dart';

/// ペアレンタルゲートのProviderです。
@riverpod
class ParentalGatePageNotifier extends _$ParentalGatePageNotifier {
  @override
  ParentalGatePageInfo build() {
    return ParentalGatePageInfo(
      maxAnswerNum: _maxAnswerNum,
      parentGateDataList: [...parentalGateList]..shuffle(),
    );
  }

  /// ペアレンタルコントロールを設定します。
  Future<void> updateParentalControl({required bool parentalControl}) async {
    ref
      ..read(saveParentalControlProvider(parentalControl: parentalControl))
      ..invalidate(isParentalControlProvider);
  }
}

/// 最大回答数
const _maxAnswerNum = 3;

/// テスト用のMock
@visibleForTesting
class MockParentalGatePageNotifier extends _$ParentalGatePageNotifier
    with Mock
    implements ParentalGatePageNotifier {}
