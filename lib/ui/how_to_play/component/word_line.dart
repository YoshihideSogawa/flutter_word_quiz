import 'package:flutter/material.dart';
import 'package:word_quiz/model/word_input.dart';
import 'package:word_quiz/ui/quiz/component/name_text.dart';

class WordLine extends StatelessWidget {
  const WordLine({
    super.key,
    required this.labelList,
    required this.nameStateList,
  });

  /// [InputWords]
  final InputWords labelList;

  /// [WordResults]
  final WordResults nameStateList;

  @override
  Widget build(BuildContext context) {
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
}
