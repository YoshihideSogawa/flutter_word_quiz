import 'package:flutter/material.dart';

/// 問題の操作系の共通フレームです。
class QuizControlFrame extends StatelessWidget {
  const QuizControlFrame({
    super.key,
    this.child,
  });

  /// 子要素
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: child,
    );
  }
}
