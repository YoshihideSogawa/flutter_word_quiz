import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_page_info.freezed.dart';

part 'splash_page_info.g.dart';

@freezed
class SplashPageInfo with _$SplashPageInfo {
  const factory SplashPageInfo({
    @Default(false) bool showRule,
    @Default(false) bool showParentalGate,
  }) = _SplashPageInfo;

  factory SplashPageInfo.fromJson(Map<String, dynamic> json) =>
      _$SplashPageInfoFromJson(json);
}
