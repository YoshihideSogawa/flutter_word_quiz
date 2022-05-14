import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_quiz/model/quiz_type.dart';
import 'package:word_quiz/model/word_name_state.dart';
import 'package:word_quiz/provider/word_input_provider.dart';
import 'package:word_quiz/ui/quiz/component/name_text.dart';
import 'package:word_quiz/ui/quiz/component/quiz_type.dart';

/// 入力した名前の一覧です。
class WordNames extends ConsumerStatefulWidget {
  const WordNames({super.key}); // coverage:ignore-line

  @override
  _WordNamesState createState() => _WordNamesState();
}

class _WordNamesState extends ConsumerState<WordNames> {
  /// 文字数
  static const _wordLength = 5;

  /// 列数
  static const rowNum = 5;

  /// 名前の列同士のスペース
  static const double _wordRowSpace = 12;

  /// 文字1文字同士のスペース
  static const double _nameRowSpace = 2;

  /// 文字1文字の最大サイズ
  static const Size _nameTextMaxSize = Size(72, 64);

  /// 1文字のWidgetのサイズ
  late Size _wordNameSize;

  @override
  void didChangeDependencies() {
    _wordNameSize = _calcWordNameSize(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final quizType = QuizType.of(context).quizType;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildNameColumn(false, quizType),
        const SizedBox(width: _wordRowSpace),
        _buildNameColumn(true, quizType),
      ],
    );
  }

  /// 名前を1行構築します。
  Widget _buildNameColumn(bool hasOffset, QuizTypes quizType) {
    return Column(
      children: [
        for (var i = 0; i < rowNum; i++)
          _buildNameLine(i + (hasOffset ? rowNum : 0), quizType),
      ],
    );
  }

  /// 名前を1つ構築します。
  Widget _buildNameLine(int rowIndex, QuizTypes quizType) {
    final wordInputNotifier = ref.watch(wordInputNotifierProvider(quizType));
    final wordsList = wordInputNotifier.wordsList;
    final wordsResultList = wordInputNotifier.wordsResultList;
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Row(
        children: [
          for (var i = 0; i < _wordLength; i++)
            Padding(
              padding: i == 0
                  ? EdgeInsets.zero
                  : const EdgeInsets.only(left: _nameRowSpace),
              child: NameText(
                text: rowIndex < wordsList.length &&
                        i < wordsList[rowIndex]!.length
                    ? wordsList[rowIndex]![i]
                    : '',
                nameState: rowIndex < wordsResultList.length &&
                        i < wordsResultList[rowIndex]!.length
                    ? wordsResultList[rowIndex]![i]
                    : WordNameState.none,
                width: _wordNameSize.width,
                height: _wordNameSize.height,
              ),
            ),
        ],
      ),
    );
  }

  /// 1文字のサイズを計算します。
  static Size _calcWordNameSize(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // 画面サイズから、左右端から確保したいパディングと列同士のスペースを引く(横並びは10文字)
    final preferredWidth =
        (screenWidth - _wordRowSpace - 16 - _nameRowSpace * 8) / 10;
    // 最大幅・高さを考慮して1文字の幅・高さを確定
    final width = min(_nameTextMaxSize.width, preferredWidth);
    final height = width * _nameTextMaxSize.height / _nameTextMaxSize.width;
    return Size(width, height);
  }
}
