import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:word_quiz/model/word_input.dart';
import 'package:word_quiz/model/word_name_state.dart';
import 'package:word_quiz/ui/quiz/component/name_text.dart';

/// 遊び方のページです。
class HowToPlayPage extends StatelessWidget {
  const HowToPlayPage({
    Key? key,
  }) : super(key: key); // coverage:ignore-line

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('あそびかた'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.catching_pokemon,
                    color: Colors.redAccent,
                  ),
                  SizedBox(width: 4),
                  Text(
                    'ワードクイズにようこそ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 4),
                  Icon(
                    Icons.catching_pokemon,
                    color: Colors.redAccent,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: 'ポケモンの'
                          ' なまえあて'
                          ' ゲームであそべます🎉\n',
                    ),
                    _buildLinkSpan(
                      'Wordle',
                      'https://www.nytimes.com/games/wordle/',
                    ),
                    const TextSpan(text: 'と'),
                    _buildLinkSpan(
                      'ポケモンWordle',
                      'https://wordle.mega-yadoran.jp/',
                    ),
                    const TextSpan(
                      text: 'をさんこうにして つくっています😍\n'
                          'ポケモンの こうしきアプリ ではありません',
                    ),
                  ],
                ),
              ),
              const Divider(),
              _buildRuleContent(),
              const Divider(),
              _buildAdvancedRule(),
              const Divider(),
              _buildRuleSameWordContent(),
              const Divider(),
              _buildOtherInfo(),
            ],
          ),
        ),
      ),
    );
  }

  /// リンク表示を構築します。
  TextSpan _buildLinkSpan(String text, String link) {
    return TextSpan(
      text: text,
      style: const TextStyle(
        color: Colors.blue,
        decoration: TextDecoration.underline,
      ),
      recognizer: TapGestureRecognizer()
        ..onTap = () {
          launch(link);
        },
    );
  }

  /// ルールの説明を構築します。
  Widget _buildRuleContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: Text(
            '🟩いろについて🟩',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 8),
        _buildWordLine(
          labelList: ['コ', 'イ', 'キ', 'ン', 'グ'],
          nameStateList: [
            WordNameState.none,
            WordNameState.match,
            WordNameState.none,
            WordNameState.none,
            WordNameState.none,
          ],
        ),
        const Text('このばあいは、「イ」がこたえにふくまれていて、ばしょもあっています。'),
        const SizedBox(height: 12),
        _buildWordLine(
          labelList: ['ギ', 'ャ', 'ラ', 'ド', 'ス'],
          nameStateList: [
            WordNameState.none,
            WordNameState.none,
            WordNameState.none,
            WordNameState.none,
            WordNameState.hit,
          ],
        ),
        const Text('このばあいは、「ス」がこたえにふくまれていますが、ばしょがちがいます。'),
        const SizedBox(height: 12),
        _buildWordLine(
          labelList: ['マ', 'リ', 'ル'],
          nameStateList: [
            WordNameState.none,
            WordNameState.none,
            WordNameState.notMatch,
          ],
        ),
        const Text('このばあいは、「ル」がこたえにふくまれていません。'),
      ],
    );
  }

  /// ワード1列を構築します。
  Widget _buildWordLine({
    required InputWords labelList,
    required WordResults nameStateList,
  }) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 2),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (var i = 0; i < labelList.length; i++)
              Padding(
                padding:
                    i == 0 ? EdgeInsets.zero : const EdgeInsets.only(left: 2),
                child: NameText(
                  text: labelList[i],
                  nameState: nameStateList[i],
                  width: 36,
                  height: 32,
                ),
              ),
          ],
        ),
      ),
    );
  }

  /// その他のルールを構築します。
  Widget _buildAdvancedRule() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Center(
          child: Text(
            '🎓そのほかのルール🎓',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 8),
        Text('・「きょうのもんだい」には ダイヤモンド・パールまでの ポケモンしかでません'),
        SizedBox(height: 8),
        Text('・「いっぱいやる」では もんだいのはんいを えらぶことができます'),
        SizedBox(height: 8),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '・こたえのポケモンは かならず',
              ),
              TextSpan(
                text: ' 5もじ ',
                style: TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(text: 'です')
            ],
          ),
        ),
        SizedBox(height: 8),
        Text('・こたえには ビリリダマ のようにおなじもじをつかうポケモンになることもあります（すこしむずかしいよ😨）'),
        SizedBox(height: 8),
        Text('・かいとうには なんもじのポケモンでも つかえます'),
      ],
    );
  }

  /// 同じ文字を使う場合のルールの説明を構築します。
  Widget _buildRuleSameWordContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: Text(
            '💫おなじもじを つかうばあい💫',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 8),
        const Text.rich(
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
        const SizedBox(height: 16),
        const Text('👉こたえが「ブーバーン」のばあいは、「ー」が2つあるので'),
        const SizedBox(height: 8),
        _buildWordLine(
          labelList: ['フ', 'リ', 'ー', 'ザ', 'ー'],
          nameStateList: [
            WordNameState.notMatch,
            WordNameState.notMatch,
            WordNameState.hit,
            WordNameState.notMatch,
            WordNameState.hit,
          ],
        ),
        const Text('このように2つとも きいろかみどりになります'),
        const SizedBox(height: 16),
        const Text('👉こたえが「カイリュー」のばあいは、「ー」が1つしかないので'),
        _buildWordLine(
          labelList: ['フ', 'リ', 'ー', 'ザ', 'ー'],
          nameStateList: [
            WordNameState.notMatch,
            WordNameState.notMatch,
            WordNameState.hit,
            WordNameState.notMatch,
            WordNameState.notMatch,
          ],
        ),
        const Text('このようにかたほうだけきいろかみどりになります'),
        const SizedBox(height: 16),
        const Text('さいしょは すこしむずかしいので やりながらおぼえていきましょう'),
        const SizedBox(height: 12),
      ],
    );
  }

  /// その他の情報を構築します。
  Widget _buildOtherInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: Text(
            '🖥アプリ開発者にむけて🖥',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text.rich(
          TextSpan(
            children: [
              const TextSpan(
                text: 'このアプリはYoshihideSogawaがFlutterの学習のために作成したアプリです。'
                    '\nソースコードはすべて',
              ),
              _buildLinkSpan(
                'オープンソース',
                'https://github.com/YoshihideSogawa/flutter_word_quiz',
              ),
              const TextSpan(
                text: 'として公開おりますので、Flutter開発者・'
                    'これからFlutterを始める方にはぜひレビューいただければ幸いです。\n',
              ),
              const TextSpan(
                text: '不具合報告・修正などはアプリストアだけでなく、プルリクやissueを通して受け付けております。',
              ),
            ],
          ),
          key: const Key('for_developer'),
        ),
      ],
    );
  }
}
