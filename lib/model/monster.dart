import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'monster.freezed.dart';

part 'monster.g.dart';

/// モンスターの情報です。
@freezed
class Monster with _$Monster {
  const factory Monster({
    required int id,
    required String name,
  }) = _Monster;

  factory Monster.fromJson(Map<String, dynamic> json) =>
      _$MonsterFromJson(json);
}
