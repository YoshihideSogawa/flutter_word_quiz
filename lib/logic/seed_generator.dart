import 'dart:convert';

import 'package:crypto/crypto.dart';

/// 文字列と連鎖数からランダムのシードとなるintを生成します。
int generateSeed(String text, int chain) {
  // ハッシュ化する
  final digest = sha256.convert(utf8.encode(text));
  final partOfDigest = digest.toString().substring(0, 10);
  return (int.tryParse(partOfDigest, radix: 16) ?? 0) + chain;
}
