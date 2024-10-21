// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'valute.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ValuteImpl _$$ValuteImplFromJson(Map<String, dynamic> json) => _$ValuteImpl(
      valute: (json['valute'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, ValuteValue.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$$ValuteImplToJson(_$ValuteImpl instance) =>
    <String, dynamic>{
      'valute': instance.valute,
    };

_$ValuteValueImpl _$$ValuteValueImplFromJson(Map<String, dynamic> json) =>
    _$ValuteValueImpl(
      id: json['id'] as String,
      numCode: json['numCode'] as String,
      charCode: json['charCode'] as String,
      nominal: (json['nominal'] as num).toInt(),
      name: json['name'] as String,
      value: (json['value'] as num).toDouble(),
      previous: (json['previous'] as num).toDouble(),
    );

Map<String, dynamic> _$$ValuteValueImplToJson(_$ValuteValueImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'numCode': instance.numCode,
      'charCode': instance.charCode,
      'nominal': instance.nominal,
      'name': instance.name,
      'value': instance.value,
      'previous': instance.previous,
    };
