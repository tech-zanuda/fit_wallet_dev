// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'valute.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Valute _$ValuteFromJson(Map<String, dynamic> json) {
  return _Valute.fromJson(json);
}

/// @nodoc
mixin _$Valute {
  Map<String, ValuteValue> get valute => throw _privateConstructorUsedError;

  /// Serializes this Valute to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Valute
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ValuteCopyWith<Valute> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValuteCopyWith<$Res> {
  factory $ValuteCopyWith(Valute value, $Res Function(Valute) then) =
      _$ValuteCopyWithImpl<$Res, Valute>;
  @useResult
  $Res call({Map<String, ValuteValue> valute});
}

/// @nodoc
class _$ValuteCopyWithImpl<$Res, $Val extends Valute>
    implements $ValuteCopyWith<$Res> {
  _$ValuteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Valute
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? valute = null,
  }) {
    return _then(_value.copyWith(
      valute: null == valute
          ? _value.valute
          : valute // ignore: cast_nullable_to_non_nullable
              as Map<String, ValuteValue>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ValuteImplCopyWith<$Res> implements $ValuteCopyWith<$Res> {
  factory _$$ValuteImplCopyWith(
          _$ValuteImpl value, $Res Function(_$ValuteImpl) then) =
      __$$ValuteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, ValuteValue> valute});
}

/// @nodoc
class __$$ValuteImplCopyWithImpl<$Res>
    extends _$ValuteCopyWithImpl<$Res, _$ValuteImpl>
    implements _$$ValuteImplCopyWith<$Res> {
  __$$ValuteImplCopyWithImpl(
      _$ValuteImpl _value, $Res Function(_$ValuteImpl) _then)
      : super(_value, _then);

  /// Create a copy of Valute
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? valute = null,
  }) {
    return _then(_$ValuteImpl(
      valute: null == valute
          ? _value._valute
          : valute // ignore: cast_nullable_to_non_nullable
              as Map<String, ValuteValue>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ValuteImpl with DiagnosticableTreeMixin implements _Valute {
  const _$ValuteImpl({required final Map<String, ValuteValue> valute})
      : _valute = valute;

  factory _$ValuteImpl.fromJson(Map<String, dynamic> json) =>
      _$$ValuteImplFromJson(json);

  final Map<String, ValuteValue> _valute;
  @override
  Map<String, ValuteValue> get valute {
    if (_valute is EqualUnmodifiableMapView) return _valute;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_valute);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Valute(valute: $valute)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Valute'))
      ..add(DiagnosticsProperty('valute', valute));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValuteImpl &&
            const DeepCollectionEquality().equals(other._valute, _valute));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_valute));

  /// Create a copy of Valute
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ValuteImplCopyWith<_$ValuteImpl> get copyWith =>
      __$$ValuteImplCopyWithImpl<_$ValuteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ValuteImplToJson(
      this,
    );
  }
}

abstract class _Valute implements Valute {
  const factory _Valute({required final Map<String, ValuteValue> valute}) =
      _$ValuteImpl;

  factory _Valute.fromJson(Map<String, dynamic> json) = _$ValuteImpl.fromJson;

  @override
  Map<String, ValuteValue> get valute;

  /// Create a copy of Valute
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ValuteImplCopyWith<_$ValuteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ValuteValue _$ValuteValueFromJson(Map<String, dynamic> json) {
  return _ValuteValue.fromJson(json);
}

/// @nodoc
mixin _$ValuteValue {
  String get id => throw _privateConstructorUsedError;
  String get numCode => throw _privateConstructorUsedError;
  String get charCode => throw _privateConstructorUsedError;
  int get nominal => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;
  double get previous => throw _privateConstructorUsedError;

  /// Serializes this ValuteValue to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ValuteValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ValuteValueCopyWith<ValuteValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValuteValueCopyWith<$Res> {
  factory $ValuteValueCopyWith(
          ValuteValue value, $Res Function(ValuteValue) then) =
      _$ValuteValueCopyWithImpl<$Res, ValuteValue>;
  @useResult
  $Res call(
      {String id,
      String numCode,
      String charCode,
      int nominal,
      String name,
      double value,
      double previous});
}

/// @nodoc
class _$ValuteValueCopyWithImpl<$Res, $Val extends ValuteValue>
    implements $ValuteValueCopyWith<$Res> {
  _$ValuteValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ValuteValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? numCode = null,
    Object? charCode = null,
    Object? nominal = null,
    Object? name = null,
    Object? value = null,
    Object? previous = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      numCode: null == numCode
          ? _value.numCode
          : numCode // ignore: cast_nullable_to_non_nullable
              as String,
      charCode: null == charCode
          ? _value.charCode
          : charCode // ignore: cast_nullable_to_non_nullable
              as String,
      nominal: null == nominal
          ? _value.nominal
          : nominal // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      previous: null == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ValuteValueImplCopyWith<$Res>
    implements $ValuteValueCopyWith<$Res> {
  factory _$$ValuteValueImplCopyWith(
          _$ValuteValueImpl value, $Res Function(_$ValuteValueImpl) then) =
      __$$ValuteValueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String numCode,
      String charCode,
      int nominal,
      String name,
      double value,
      double previous});
}

/// @nodoc
class __$$ValuteValueImplCopyWithImpl<$Res>
    extends _$ValuteValueCopyWithImpl<$Res, _$ValuteValueImpl>
    implements _$$ValuteValueImplCopyWith<$Res> {
  __$$ValuteValueImplCopyWithImpl(
      _$ValuteValueImpl _value, $Res Function(_$ValuteValueImpl) _then)
      : super(_value, _then);

  /// Create a copy of ValuteValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? numCode = null,
    Object? charCode = null,
    Object? nominal = null,
    Object? name = null,
    Object? value = null,
    Object? previous = null,
  }) {
    return _then(_$ValuteValueImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      numCode: null == numCode
          ? _value.numCode
          : numCode // ignore: cast_nullable_to_non_nullable
              as String,
      charCode: null == charCode
          ? _value.charCode
          : charCode // ignore: cast_nullable_to_non_nullable
              as String,
      nominal: null == nominal
          ? _value.nominal
          : nominal // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      previous: null == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ValuteValueImpl with DiagnosticableTreeMixin implements _ValuteValue {
  const _$ValuteValueImpl(
      {required this.id,
      required this.numCode,
      required this.charCode,
      required this.nominal,
      required this.name,
      required this.value,
      required this.previous});

  factory _$ValuteValueImpl.fromJson(Map<String, dynamic> json) =>
      _$$ValuteValueImplFromJson(json);

  @override
  final String id;
  @override
  final String numCode;
  @override
  final String charCode;
  @override
  final int nominal;
  @override
  final String name;
  @override
  final double value;
  @override
  final double previous;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ValuteValue(id: $id, numCode: $numCode, charCode: $charCode, nominal: $nominal, name: $name, value: $value, previous: $previous)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ValuteValue'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('numCode', numCode))
      ..add(DiagnosticsProperty('charCode', charCode))
      ..add(DiagnosticsProperty('nominal', nominal))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('value', value))
      ..add(DiagnosticsProperty('previous', previous));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValuteValueImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.numCode, numCode) || other.numCode == numCode) &&
            (identical(other.charCode, charCode) ||
                other.charCode == charCode) &&
            (identical(other.nominal, nominal) || other.nominal == nominal) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.previous, previous) ||
                other.previous == previous));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, numCode, charCode, nominal, name, value, previous);

  /// Create a copy of ValuteValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ValuteValueImplCopyWith<_$ValuteValueImpl> get copyWith =>
      __$$ValuteValueImplCopyWithImpl<_$ValuteValueImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ValuteValueImplToJson(
      this,
    );
  }
}

abstract class _ValuteValue implements ValuteValue {
  const factory _ValuteValue(
      {required final String id,
      required final String numCode,
      required final String charCode,
      required final int nominal,
      required final String name,
      required final double value,
      required final double previous}) = _$ValuteValueImpl;

  factory _ValuteValue.fromJson(Map<String, dynamic> json) =
      _$ValuteValueImpl.fromJson;

  @override
  String get id;
  @override
  String get numCode;
  @override
  String get charCode;
  @override
  int get nominal;
  @override
  String get name;
  @override
  double get value;
  @override
  double get previous;

  /// Create a copy of ValuteValue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ValuteValueImplCopyWith<_$ValuteValueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
