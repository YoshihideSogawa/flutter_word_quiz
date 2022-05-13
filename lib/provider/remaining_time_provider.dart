import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/logic/date_utils.dart';

/// 残り時間に関するProviderです。
final remainingTimeProvider =
    StateNotifierProvider.autoDispose<RemainingTimerNotifier, String>((ref) {
  return RemainingTimerNotifier('');
});

class RemainingTimerNotifier extends StateNotifier<String> {
  RemainingTimerNotifier(super.state) {
    init();
  }

  /// [Timer]
  late Timer _timer;

  @visibleForTesting
  void init() {
    _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      final newRemainingTime = parseRemainingTimeText();
      if (newRemainingTime != state) {
        state = parseRemainingTimeText();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
