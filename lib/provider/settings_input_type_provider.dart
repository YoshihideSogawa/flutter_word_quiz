import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/settings_input_type.dart';
import 'package:word_quiz/repository/settings_repository.dart';

/// 入力タイプの設定
final settingsInputTypeProvider =
    StateNotifierProvider<SettingsInputTypeNotifier, int>(
  SettingsInputTypeNotifier.new,
);

class SettingsInputTypeNotifier extends StateNotifier<int> {
  SettingsInputTypeNotifier(
    this._ref,
  ) : super(inputTypeSwitching) {
    init();
  }

  /// [Ref]
  final Ref _ref;

  @visibleForTesting
  void init() {
    final inputType = _ref.read(settingsRepositoryProvider).inputType();
    state = inputType ?? inputTypeSwitching;
  }

  /// 入力タイプを更新します。
  void updateInputType(int value) {
    _ref.read(settingsRepositoryProvider).saveInputType(value);
    state = value;
  }
}
