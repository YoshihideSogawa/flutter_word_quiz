import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/parental_gate_list.dart';
import 'package:word_quiz/model/parental_gate_page_info.dart';
import 'package:word_quiz/repository/app_property_repository.dart';

/// ペアレンタルゲートのProviderです。
final parentalGatePageProvider = StateNotifierProvider.autoDispose<
    ParentalGatePageNotifier, ParentalGatePageInfo>(
  ParentalGatePageNotifier.new,
);

class ParentalGatePageNotifier extends StateNotifier<ParentalGatePageInfo> {
  ParentalGatePageNotifier(this._ref)
      : super(
          const ParentalGatePageInfo(
            maxAnswerNum: _maxAnswerNum,
          ),
        ) {
    pick();
  }

  /// [Ref]
  final Ref _ref;

  /// 最大回答数
  static const _maxAnswerNum = 3;

  /// ペアレンタルゲート用のキャラクターを選択します。
  void pick() {
    final randomInt = Random().nextInt(parentalGateList.length);
    final pickedParentalGate = parentalGateList[randomInt];
    final newAnswerList = [...?pickedParentalGate.answerList]..shuffle();
    state = state.copyWith(
      answerNum: state.answerNum + 1,
      targetData: pickedParentalGate.copyWith(
        answerList: newAnswerList,
      ),
    );
  }

  /// ペアレンタルコントロールを設定します。
  void updateParentalControl({required bool parentalControl}) {
    _ref
        .read(appPropertyRepositoryProvider)
        .saveParentalControl(parentalControl: parentalControl);
  }
}
