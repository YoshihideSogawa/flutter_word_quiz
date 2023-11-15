import 'package:flutter/material.dart';
import 'package:word_quiz/model/word_name_state.dart';
import 'package:word_quiz/ui/how_to_play/component/word_line.dart';

/// ルール内容です。
class RuleContent extends StatelessWidget {
  const RuleContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            '🟩いろについて🟩',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 8),
        WordLine(
          labelList: ['コ', 'イ', 'キ', 'ン', 'グ'],
          nameStateList: [
            WordNameState.none,
            WordNameState.match,
            WordNameState.none,
            WordNameState.none,
            WordNameState.none,
          ],
        ),
        Text('このばあいは、「イ」がこたえにふくまれていて、ばしょもあっています。'),
        SizedBox(height: 12),
        WordLine(
          labelList: ['ギ', 'ャ', 'ラ', 'ド', 'ス'],
          nameStateList: [
            WordNameState.none,
            WordNameState.none,
            WordNameState.none,
            WordNameState.none,
            WordNameState.hit,
          ],
        ),
        Text('このばあいは、「ス」がこたえにふくまれていますが、ばしょがちがいます。'),
        SizedBox(height: 12),
        WordLine(
          labelList: ['マ', 'リ', 'ル'],
          nameStateList: [
            WordNameState.none,
            WordNameState.none,
            WordNameState.notMatch,
          ],
        ),
        Text('このばあいは、「ル」がこたえにふくまれていません。'),
      ],
    );
  }
}
