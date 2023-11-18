import 'package:flutter/foundation.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:word_quiz/model/parental_gate_list.dart';
import 'package:word_quiz/model/parental_gate_page_info.dart';
import 'package:word_quiz/repository/app_property/parental_control_repository.dart';

part 'parental_gate_page_notifier.g.dart';

/// ペアレンタルゲートのProviderです。
@riverpod
class ParentalGatePageNotifier extends _$ParentalGatePageNotifier {
  @override
  ParentalGatePageInfo build() {
    // 元のデータを並べかえ
    final parentGateDataList = [...parentalGateList]..shuffle();
    // さらに個別のanswerListをシャッフルする
    final parentalGateDataList = parentGateDataList.map((parentalGateData) {
      final newAnswerList = [...?parentalGateData.answerList]..shuffle();
      return parentalGateData.copyWith(
        answerList: newAnswerList,
      );
    }).toList();

    return ParentalGatePageInfo(
      maxAnswerNum: _maxAnswerNum,
      parentalGateDataList: parentalGateDataList,
    );
  }

  /// ペアレンタルコントロールを設定します。
  Future<void> updateParentalControl({required bool parentalControl}) async {
    await ref
        .read(parentalControlRepositoryProvider.notifier)
        .saveParentalControl(parentalControl: parentalControl);
  }
}

/// 最大回答数
const _maxAnswerNum = 3;

/// テスト用のMock
@visibleForTesting
class MockParentalGatePageNotifier extends _$ParentalGatePageNotifier
    with Mock
    implements ParentalGatePageNotifier {}
