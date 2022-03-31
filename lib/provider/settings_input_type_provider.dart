import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/settings_input_type.dart';
import 'package:word_quiz/repository/settings_repository.dart';

/// 入力タイプの設定
final settingsInputTypeProvider =
    StateNotifierProvider<SettingsInputTypeNotifier, int>(
  (ref) => SettingsInputTypeNotifier(ref.read),
);

class SettingsInputTypeNotifier extends StateNotifier<int> {
  SettingsInputTypeNotifier(
    this._reader,
  ) : super(inputTypeSwitching) {
    init();
  }

  /// [Reader]
  final Reader _reader;

  @visibleForTesting
  void init() {
    final inputType = _reader(settingsRepositoryProvider).inputType();
    state = inputType ?? inputTypeSwitching;
  }

  /// 入力タイプを更新します。
  void updateInputType(int value) {
    _reader(settingsRepositoryProvider).saveInputType(value);
    state = value;
  }
}
