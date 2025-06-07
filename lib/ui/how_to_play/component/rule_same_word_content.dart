import 'package:flutter/material.dart';
import 'package:word_quiz/model/word_name_state.dart';
import 'package:word_quiz/ui/how_to_play/component/word_line.dart';

/// 同じ文字を使う場合のルール内容です。
class RuleSameWordContent extends StatelessWidget {
  const RuleSameWordContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            '💫おなじもじを つかうばあい💫',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 8),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: '「フ'),
              TextSpan(text: 'リ'),
              TextSpan(
                text: 'ー',
                style: TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(text: 'ザ'),
              TextSpan(
                text: 'ー',
                style: TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(text: '」のようにおなじもじを かいとうにつかったばあいです。'),
            ],
          ),
        ),
        SizedBox(height: 16),
        Text('👉こたえが「ブーバーン」のばあいは、「ー」が2つあるので'),
        SizedBox(height: 8),
        WordLine(
          labelList: ['フ', 'リ', 'ー', 'ザ', 'ー'],
          nameStateList: [
            WordNameState.notMatch,
            WordNameState.notMatch,
            WordNameState.hit,
            WordNameState.notMatch,
            WordNameState.hit,
          ],
        ),
        Text('このように2つとも きいろかみどりになります'),
        SizedBox(height: 16),
        Text('👉こたえが「カイリュー」のばあいは、「ー」が1つしかないので'),
        WordLine(
          labelList: ['フ', 'リ', 'ー', 'ザ', 'ー'],
          nameStateList: [
            WordNameState.notMatch,
            WordNameState.notMatch,
            WordNameState.hit,
            WordNameState.notMatch,
            WordNameState.notMatch,
          ],
        ),
        Text('このようにかたほうだけきいろかみどりになります'),
        SizedBox(height: 16),
        Text('さいしょは すこしむずかしいので やりながらおぼえていきましょう'),
        SizedBox(height: 12),
      ],
    );
  }
}
