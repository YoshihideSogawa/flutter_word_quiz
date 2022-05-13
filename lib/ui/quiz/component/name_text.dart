import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:word_quiz/model/word_name_state.dart';
import 'package:word_quiz/ui/quiz/app_colors.dart';

/// 1文字を表します。
class NameText extends HookWidget {
  const NameText({
    super.key,
    this.text,
    required this.width,
    required this.height,
    required this.nameState,
  }); // coverage:ignore-line

  /// 幅
  final double width;

  /// 高さ
  final double height;

  /// 入力文字の状態
  final WordNameState nameState;

  /// テキスト
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const Key('name_text_container'),
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(
          color: _borderColor(),
          width: 1.2,
        ),
        borderRadius: BorderRadius.circular(4),
        color: _boxColor(),
      ),
      child: Center(
        child: Text(
          text ?? '',
          key: const Key('name_character'),
          style: TextStyle(
            color: _textColor(),
            fontWeight: FontWeight.bold,
            fontSize: max(13.5, width * 0.35),
          ),
        ),
      ),
    );
  }

  /// 枠線の色を取得します。
  Color _borderColor() {
    switch (nameState) {
      case WordNameState.none:
        return Theme.of(useContext()).brightness == Brightness.dark
            ? Colors.white24
            : Colors.black26;
      case WordNameState.hit:
        return hitColor;
      case WordNameState.match:
        return matchColor;
      case WordNameState.notMatch:
        return notMatchColor;
    }
  }

  /// テキストの色を取得します。
  Color? _textColor() {
    switch (nameState) {
      case WordNameState.none:
        return Theme.of(useContext()).textTheme.subtitle1?.color ??
            Colors.blueAccent;
      case WordNameState.hit:
        return Colors.white;
      case WordNameState.match:
        return Colors.white;
      case WordNameState.notMatch:
        return Colors.white;
    }
  }

  /// ボックスの色を取得します。
  Color? _boxColor() {
    switch (nameState) {
      case WordNameState.none:
        return Colors.transparent;
      case WordNameState.hit:
        return hitColor;
      case WordNameState.match:
        return matchColor;
      case WordNameState.notMatch:
        return notMatchColor;
    }
  }
}
