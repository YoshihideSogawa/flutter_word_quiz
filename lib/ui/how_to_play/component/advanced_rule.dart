import 'package:flutter/material.dart';

/// その他のルールです。
class AdvancedRule extends StatelessWidget {
  const AdvancedRule({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
              TextSpan(text: 'です'),
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
}
