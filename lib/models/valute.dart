import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'valute.freezed.dart';
part 'valute.g.dart';

@freezed
class Valute with _$Valute {
  const factory Valute({
    required Map<String, ValuteValue> valute,
  }) = _Valute;

  factory Valute.fromJson(Map<String, dynamic> json) => _$ValuteFromJson(json);
}

@freezed
class ValuteValue with _$ValuteValue {
  const factory ValuteValue({
    required String id,
    required String numCode,
    required String charCode,
    required int nominal,
    required String name,
    required double value,
    required double previous,
  }) = _ValuteValue;

  factory ValuteValue.fromJson(Map<String, dynamic> json) =>
      _$ValuteValueFromJson(json);
}
