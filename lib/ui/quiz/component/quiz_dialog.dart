import 'package:flutter/material.dart';

/// 擬似的なダイアログを構成します。
class QuizDialog extends StatelessWidget {
  const QuizDialog({
    super.key,
    this.child,
    this.onTap,
  });

  /// コンテンツ
  final Widget? child;

  /// ダイアログの外側タップ時の処理
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.black12,
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: GestureDetector(
            key: const Key('quiz_dialog_content_gesture'),
            onTap: () {
              // 親のonTapが影響しないようにガード
            },
            child: child,
          ),
        ),
      ),
    );
  }
}
