import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:word_quiz/logic/date_utils.dart';

/// 問題が変わるまでの時間表示を行います。
class ClockText extends HookWidget {
  const ClockText({super.key});

  @override
  Widget build(BuildContext context) {
    final timer = useRef<Timer?>(null);
    final remainingTime = useState(parseRemainingTimeText());

    useEffect(
      () {
        timer.value = Timer.periodic(const Duration(milliseconds: 50), (timer) {
          final newRemainingTime = parseRemainingTimeText();
          if (newRemainingTime != remainingTime.value) {
            remainingTime.value = parseRemainingTimeText();
          }
        });
        return timer.value?.cancel;
      },
      const [],
    );

    return Text(
      key: const Key('clock_text'),
      remainingTime.value,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
