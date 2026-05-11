// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'db.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StoolapValue {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int field0) integer,
    required TResult Function(double field0) float,
    required TResult Function(String field0) text,
    required TResult Function(bool field0) boolean,
    required TResult Function(Float32List field0) vector,
    required TResult Function(String field0) json,
    required TResult Function(int field0) timestamp,
    required TResult Function(int field0) date,
    required TResult Function() null_,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int field0)? integer,
    TResult? Function(double field0)? float,
    TResult? Function(String field0)? text,
    TResult? Function(bool field0)? boolean,
    TResult? Function(Float32List field0)? vector,
    TResult? Function(String field0)? json,
    TResult? Function(int field0)? timestamp,
    TResult? Function(int field0)? date,
    TResult? Function()? null_,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int field0)? integer,
    TResult Function(double field0)? float,
    TResult Function(String field0)? text,
    TResult Function(bool field0)? boolean,
    TResult Function(Float32List field0)? vector,
    TResult Function(String field0)? json,
    TResult Function(int field0)? timestamp,
    TResult Function(int field0)? date,
    TResult Function()? null_,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StoolapValue_Integer value) integer,
    required TResult Function(StoolapValue_Float value) float,
    required TResult Function(StoolapValue_Text value) text,
    required TResult Function(StoolapValue_Boolean value) boolean,
    required TResult Function(StoolapValue_Vector value) vector,
    required TResult Function(StoolapValue_Json value) json,
    required TResult Function(StoolapValue_Timestamp value) timestamp,
    required TResult Function(StoolapValue_Date value) date,
    required TResult Function(StoolapValue_Null value) null_,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StoolapValue_Integer value)? integer,
    TResult? Function(StoolapValue_Float value)? float,
    TResult? Function(StoolapValue_Text value)? text,
    TResult? Function(StoolapValue_Boolean value)? boolean,
    TResult? Function(StoolapValue_Vector value)? vector,
    TResult? Function(StoolapValue_Json value)? json,
    TResult? Function(StoolapValue_Timestamp value)? timestamp,
    TResult? Function(StoolapValue_Date value)? date,
    TResult? Function(StoolapValue_Null value)? null_,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StoolapValue_Integer value)? integer,
    TResult Function(StoolapValue_Float value)? float,
    TResult Function(StoolapValue_Text value)? text,
    TResult Function(StoolapValue_Boolean value)? boolean,
    TResult Function(StoolapValue_Vector value)? vector,
    TResult Function(StoolapValue_Json value)? json,
    TResult Function(StoolapValue_Timestamp value)? timestamp,
    TResult Function(StoolapValue_Date value)? date,
    TResult Function(StoolapValue_Null value)? null_,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoolapValueCopyWith<$Res> {
  factory $StoolapValueCopyWith(
          StoolapValue value, $Res Function(StoolapValue) then) =
      _$StoolapValueCopyWithImpl<$Res, StoolapValue>;
}

/// @nodoc
class _$StoolapValueCopyWithImpl<$Res, $Val extends StoolapValue>
    implements $StoolapValueCopyWith<$Res> {
  _$StoolapValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StoolapValue
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StoolapValue_IntegerImplCopyWith<$Res> {
  factory _$$StoolapValue_IntegerImplCopyWith(_$StoolapValue_IntegerImpl value,
          $Res Function(_$StoolapValue_IntegerImpl) then) =
      __$$StoolapValue_IntegerImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int field0});
}

/// @nodoc
class __$$StoolapValue_IntegerImplCopyWithImpl<$Res>
    extends _$StoolapValueCopyWithImpl<$Res, _$StoolapValue_IntegerImpl>
    implements _$$StoolapValue_IntegerImplCopyWith<$Res> {
  __$$StoolapValue_IntegerImplCopyWithImpl(_$StoolapValue_IntegerImpl _value,
      $Res Function(_$StoolapValue_IntegerImpl) _then)
      : super(_value, _then);

  /// Create a copy of StoolapValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$StoolapValue_IntegerImpl(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$StoolapValue_IntegerImpl extends StoolapValue_Integer {
  const _$StoolapValue_IntegerImpl(this.field0) : super._();

  @override
  final int field0;

  @override
  String toString() {
    return 'StoolapValue.integer(field0: $field0)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoolapValue_IntegerImpl &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  /// Create a copy of StoolapValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoolapValue_IntegerImplCopyWith<_$StoolapValue_IntegerImpl>
      get copyWith =>
          __$$StoolapValue_IntegerImplCopyWithImpl<_$StoolapValue_IntegerImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int field0) integer,
    required TResult Function(double field0) float,
    required TResult Function(String field0) text,
    required TResult Function(bool field0) boolean,
    required TResult Function(Float32List field0) vector,
    required TResult Function(String field0) json,
    required TResult Function(int field0) timestamp,
    required TResult Function(int field0) date,
    required TResult Function() null_,
  }) {
    return integer(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int field0)? integer,
    TResult? Function(double field0)? float,
    TResult? Function(String field0)? text,
    TResult? Function(bool field0)? boolean,
    TResult? Function(Float32List field0)? vector,
    TResult? Function(String field0)? json,
    TResult? Function(int field0)? timestamp,
    TResult? Function(int field0)? date,
    TResult? Function()? null_,
  }) {
    return integer?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int field0)? integer,
    TResult Function(double field0)? float,
    TResult Function(String field0)? text,
    TResult Function(bool field0)? boolean,
    TResult Function(Float32List field0)? vector,
    TResult Function(String field0)? json,
    TResult Function(int field0)? timestamp,
    TResult Function(int field0)? date,
    TResult Function()? null_,
    required TResult orElse(),
  }) {
    if (integer != null) {
      return integer(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StoolapValue_Integer value) integer,
    required TResult Function(StoolapValue_Float value) float,
    required TResult Function(StoolapValue_Text value) text,
    required TResult Function(StoolapValue_Boolean value) boolean,
    required TResult Function(StoolapValue_Vector value) vector,
    required TResult Function(StoolapValue_Json value) json,
    required TResult Function(StoolapValue_Timestamp value) timestamp,
    required TResult Function(StoolapValue_Date value) date,
    required TResult Function(StoolapValue_Null value) null_,
  }) {
    return integer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StoolapValue_Integer value)? integer,
    TResult? Function(StoolapValue_Float value)? float,
    TResult? Function(StoolapValue_Text value)? text,
    TResult? Function(StoolapValue_Boolean value)? boolean,
    TResult? Function(StoolapValue_Vector value)? vector,
    TResult? Function(StoolapValue_Json value)? json,
    TResult? Function(StoolapValue_Timestamp value)? timestamp,
    TResult? Function(StoolapValue_Date value)? date,
    TResult? Function(StoolapValue_Null value)? null_,
  }) {
    return integer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StoolapValue_Integer value)? integer,
    TResult Function(StoolapValue_Float value)? float,
    TResult Function(StoolapValue_Text value)? text,
    TResult Function(StoolapValue_Boolean value)? boolean,
    TResult Function(StoolapValue_Vector value)? vector,
    TResult Function(StoolapValue_Json value)? json,
    TResult Function(StoolapValue_Timestamp value)? timestamp,
    TResult Function(StoolapValue_Date value)? date,
    TResult Function(StoolapValue_Null value)? null_,
    required TResult orElse(),
  }) {
    if (integer != null) {
      return integer(this);
    }
    return orElse();
  }
}

abstract class StoolapValue_Integer extends StoolapValue {
  const factory StoolapValue_Integer(final int field0) =
      _$StoolapValue_IntegerImpl;
  const StoolapValue_Integer._() : super._();

  int get field0;

  /// Create a copy of StoolapValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoolapValue_IntegerImplCopyWith<_$StoolapValue_IntegerImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StoolapValue_FloatImplCopyWith<$Res> {
  factory _$$StoolapValue_FloatImplCopyWith(_$StoolapValue_FloatImpl value,
          $Res Function(_$StoolapValue_FloatImpl) then) =
      __$$StoolapValue_FloatImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double field0});
}

/// @nodoc
class __$$StoolapValue_FloatImplCopyWithImpl<$Res>
    extends _$StoolapValueCopyWithImpl<$Res, _$StoolapValue_FloatImpl>
    implements _$$StoolapValue_FloatImplCopyWith<$Res> {
  __$$StoolapValue_FloatImplCopyWithImpl(_$StoolapValue_FloatImpl _value,
      $Res Function(_$StoolapValue_FloatImpl) _then)
      : super(_value, _then);

  /// Create a copy of StoolapValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$StoolapValue_FloatImpl(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$StoolapValue_FloatImpl extends StoolapValue_Float {
  const _$StoolapValue_FloatImpl(this.field0) : super._();

  @override
  final double field0;

  @override
  String toString() {
    return 'StoolapValue.float(field0: $field0)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoolapValue_FloatImpl &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  /// Create a copy of StoolapValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoolapValue_FloatImplCopyWith<_$StoolapValue_FloatImpl> get copyWith =>
      __$$StoolapValue_FloatImplCopyWithImpl<_$StoolapValue_FloatImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int field0) integer,
    required TResult Function(double field0) float,
    required TResult Function(String field0) text,
    required TResult Function(bool field0) boolean,
    required TResult Function(Float32List field0) vector,
    required TResult Function(String field0) json,
    required TResult Function(int field0) timestamp,
    required TResult Function(int field0) date,
    required TResult Function() null_,
  }) {
    return float(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int field0)? integer,
    TResult? Function(double field0)? float,
    TResult? Function(String field0)? text,
    TResult? Function(bool field0)? boolean,
    TResult? Function(Float32List field0)? vector,
    TResult? Function(String field0)? json,
    TResult? Function(int field0)? timestamp,
    TResult? Function(int field0)? date,
    TResult? Function()? null_,
  }) {
    return float?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int field0)? integer,
    TResult Function(double field0)? float,
    TResult Function(String field0)? text,
    TResult Function(bool field0)? boolean,
    TResult Function(Float32List field0)? vector,
    TResult Function(String field0)? json,
    TResult Function(int field0)? timestamp,
    TResult Function(int field0)? date,
    TResult Function()? null_,
    required TResult orElse(),
  }) {
    if (float != null) {
      return float(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StoolapValue_Integer value) integer,
    required TResult Function(StoolapValue_Float value) float,
    required TResult Function(StoolapValue_Text value) text,
    required TResult Function(StoolapValue_Boolean value) boolean,
    required TResult Function(StoolapValue_Vector value) vector,
    required TResult Function(StoolapValue_Json value) json,
    required TResult Function(StoolapValue_Timestamp value) timestamp,
    required TResult Function(StoolapValue_Date value) date,
    required TResult Function(StoolapValue_Null value) null_,
  }) {
    return float(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StoolapValue_Integer value)? integer,
    TResult? Function(StoolapValue_Float value)? float,
    TResult? Function(StoolapValue_Text value)? text,
    TResult? Function(StoolapValue_Boolean value)? boolean,
    TResult? Function(StoolapValue_Vector value)? vector,
    TResult? Function(StoolapValue_Json value)? json,
    TResult? Function(StoolapValue_Timestamp value)? timestamp,
    TResult? Function(StoolapValue_Date value)? date,
    TResult? Function(StoolapValue_Null value)? null_,
  }) {
    return float?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StoolapValue_Integer value)? integer,
    TResult Function(StoolapValue_Float value)? float,
    TResult Function(StoolapValue_Text value)? text,
    TResult Function(StoolapValue_Boolean value)? boolean,
    TResult Function(StoolapValue_Vector value)? vector,
    TResult Function(StoolapValue_Json value)? json,
    TResult Function(StoolapValue_Timestamp value)? timestamp,
    TResult Function(StoolapValue_Date value)? date,
    TResult Function(StoolapValue_Null value)? null_,
    required TResult orElse(),
  }) {
    if (float != null) {
      return float(this);
    }
    return orElse();
  }
}

abstract class StoolapValue_Float extends StoolapValue {
  const factory StoolapValue_Float(final double field0) =
      _$StoolapValue_FloatImpl;
  const StoolapValue_Float._() : super._();

  double get field0;

  /// Create a copy of StoolapValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoolapValue_FloatImplCopyWith<_$StoolapValue_FloatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StoolapValue_TextImplCopyWith<$Res> {
  factory _$$StoolapValue_TextImplCopyWith(_$StoolapValue_TextImpl value,
          $Res Function(_$StoolapValue_TextImpl) then) =
      __$$StoolapValue_TextImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String field0});
}

/// @nodoc
class __$$StoolapValue_TextImplCopyWithImpl<$Res>
    extends _$StoolapValueCopyWithImpl<$Res, _$StoolapValue_TextImpl>
    implements _$$StoolapValue_TextImplCopyWith<$Res> {
  __$$StoolapValue_TextImplCopyWithImpl(_$StoolapValue_TextImpl _value,
      $Res Function(_$StoolapValue_TextImpl) _then)
      : super(_value, _then);

  /// Create a copy of StoolapValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$StoolapValue_TextImpl(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$StoolapValue_TextImpl extends StoolapValue_Text {
  const _$StoolapValue_TextImpl(this.field0) : super._();

  @override
  final String field0;

  @override
  String toString() {
    return 'StoolapValue.text(field0: $field0)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoolapValue_TextImpl &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  /// Create a copy of StoolapValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoolapValue_TextImplCopyWith<_$StoolapValue_TextImpl> get copyWith =>
      __$$StoolapValue_TextImplCopyWithImpl<_$StoolapValue_TextImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int field0) integer,
    required TResult Function(double field0) float,
    required TResult Function(String field0) text,
    required TResult Function(bool field0) boolean,
    required TResult Function(Float32List field0) vector,
    required TResult Function(String field0) json,
    required TResult Function(int field0) timestamp,
    required TResult Function(int field0) date,
    required TResult Function() null_,
  }) {
    return text(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int field0)? integer,
    TResult? Function(double field0)? float,
    TResult? Function(String field0)? text,
    TResult? Function(bool field0)? boolean,
    TResult? Function(Float32List field0)? vector,
    TResult? Function(String field0)? json,
    TResult? Function(int field0)? timestamp,
    TResult? Function(int field0)? date,
    TResult? Function()? null_,
  }) {
    return text?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int field0)? integer,
    TResult Function(double field0)? float,
    TResult Function(String field0)? text,
    TResult Function(bool field0)? boolean,
    TResult Function(Float32List field0)? vector,
    TResult Function(String field0)? json,
    TResult Function(int field0)? timestamp,
    TResult Function(int field0)? date,
    TResult Function()? null_,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StoolapValue_Integer value) integer,
    required TResult Function(StoolapValue_Float value) float,
    required TResult Function(StoolapValue_Text value) text,
    required TResult Function(StoolapValue_Boolean value) boolean,
    required TResult Function(StoolapValue_Vector value) vector,
    required TResult Function(StoolapValue_Json value) json,
    required TResult Function(StoolapValue_Timestamp value) timestamp,
    required TResult Function(StoolapValue_Date value) date,
    required TResult Function(StoolapValue_Null value) null_,
  }) {
    return text(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StoolapValue_Integer value)? integer,
    TResult? Function(StoolapValue_Float value)? float,
    TResult? Function(StoolapValue_Text value)? text,
    TResult? Function(StoolapValue_Boolean value)? boolean,
    TResult? Function(StoolapValue_Vector value)? vector,
    TResult? Function(StoolapValue_Json value)? json,
    TResult? Function(StoolapValue_Timestamp value)? timestamp,
    TResult? Function(StoolapValue_Date value)? date,
    TResult? Function(StoolapValue_Null value)? null_,
  }) {
    return text?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StoolapValue_Integer value)? integer,
    TResult Function(StoolapValue_Float value)? float,
    TResult Function(StoolapValue_Text value)? text,
    TResult Function(StoolapValue_Boolean value)? boolean,
    TResult Function(StoolapValue_Vector value)? vector,
    TResult Function(StoolapValue_Json value)? json,
    TResult Function(StoolapValue_Timestamp value)? timestamp,
    TResult Function(StoolapValue_Date value)? date,
    TResult Function(StoolapValue_Null value)? null_,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(this);
    }
    return orElse();
  }
}

abstract class StoolapValue_Text extends StoolapValue {
  const factory StoolapValue_Text(final String field0) =
      _$StoolapValue_TextImpl;
  const StoolapValue_Text._() : super._();

  String get field0;

  /// Create a copy of StoolapValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoolapValue_TextImplCopyWith<_$StoolapValue_TextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StoolapValue_BooleanImplCopyWith<$Res> {
  factory _$$StoolapValue_BooleanImplCopyWith(_$StoolapValue_BooleanImpl value,
          $Res Function(_$StoolapValue_BooleanImpl) then) =
      __$$StoolapValue_BooleanImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool field0});
}

/// @nodoc
class __$$StoolapValue_BooleanImplCopyWithImpl<$Res>
    extends _$StoolapValueCopyWithImpl<$Res, _$StoolapValue_BooleanImpl>
    implements _$$StoolapValue_BooleanImplCopyWith<$Res> {
  __$$StoolapValue_BooleanImplCopyWithImpl(_$StoolapValue_BooleanImpl _value,
      $Res Function(_$StoolapValue_BooleanImpl) _then)
      : super(_value, _then);

  /// Create a copy of StoolapValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$StoolapValue_BooleanImpl(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$StoolapValue_BooleanImpl extends StoolapValue_Boolean {
  const _$StoolapValue_BooleanImpl(this.field0) : super._();

  @override
  final bool field0;

  @override
  String toString() {
    return 'StoolapValue.boolean(field0: $field0)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoolapValue_BooleanImpl &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  /// Create a copy of StoolapValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoolapValue_BooleanImplCopyWith<_$StoolapValue_BooleanImpl>
      get copyWith =>
          __$$StoolapValue_BooleanImplCopyWithImpl<_$StoolapValue_BooleanImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int field0) integer,
    required TResult Function(double field0) float,
    required TResult Function(String field0) text,
    required TResult Function(bool field0) boolean,
    required TResult Function(Float32List field0) vector,
    required TResult Function(String field0) json,
    required TResult Function(int field0) timestamp,
    required TResult Function(int field0) date,
    required TResult Function() null_,
  }) {
    return boolean(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int field0)? integer,
    TResult? Function(double field0)? float,
    TResult? Function(String field0)? text,
    TResult? Function(bool field0)? boolean,
    TResult? Function(Float32List field0)? vector,
    TResult? Function(String field0)? json,
    TResult? Function(int field0)? timestamp,
    TResult? Function(int field0)? date,
    TResult? Function()? null_,
  }) {
    return boolean?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int field0)? integer,
    TResult Function(double field0)? float,
    TResult Function(String field0)? text,
    TResult Function(bool field0)? boolean,
    TResult Function(Float32List field0)? vector,
    TResult Function(String field0)? json,
    TResult Function(int field0)? timestamp,
    TResult Function(int field0)? date,
    TResult Function()? null_,
    required TResult orElse(),
  }) {
    if (boolean != null) {
      return boolean(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StoolapValue_Integer value) integer,
    required TResult Function(StoolapValue_Float value) float,
    required TResult Function(StoolapValue_Text value) text,
    required TResult Function(StoolapValue_Boolean value) boolean,
    required TResult Function(StoolapValue_Vector value) vector,
    required TResult Function(StoolapValue_Json value) json,
    required TResult Function(StoolapValue_Timestamp value) timestamp,
    required TResult Function(StoolapValue_Date value) date,
    required TResult Function(StoolapValue_Null value) null_,
  }) {
    return boolean(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StoolapValue_Integer value)? integer,
    TResult? Function(StoolapValue_Float value)? float,
    TResult? Function(StoolapValue_Text value)? text,
    TResult? Function(StoolapValue_Boolean value)? boolean,
    TResult? Function(StoolapValue_Vector value)? vector,
    TResult? Function(StoolapValue_Json value)? json,
    TResult? Function(StoolapValue_Timestamp value)? timestamp,
    TResult? Function(StoolapValue_Date value)? date,
    TResult? Function(StoolapValue_Null value)? null_,
  }) {
    return boolean?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StoolapValue_Integer value)? integer,
    TResult Function(StoolapValue_Float value)? float,
    TResult Function(StoolapValue_Text value)? text,
    TResult Function(StoolapValue_Boolean value)? boolean,
    TResult Function(StoolapValue_Vector value)? vector,
    TResult Function(StoolapValue_Json value)? json,
    TResult Function(StoolapValue_Timestamp value)? timestamp,
    TResult Function(StoolapValue_Date value)? date,
    TResult Function(StoolapValue_Null value)? null_,
    required TResult orElse(),
  }) {
    if (boolean != null) {
      return boolean(this);
    }
    return orElse();
  }
}

abstract class StoolapValue_Boolean extends StoolapValue {
  const factory StoolapValue_Boolean(final bool field0) =
      _$StoolapValue_BooleanImpl;
  const StoolapValue_Boolean._() : super._();

  bool get field0;

  /// Create a copy of StoolapValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoolapValue_BooleanImplCopyWith<_$StoolapValue_BooleanImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StoolapValue_VectorImplCopyWith<$Res> {
  factory _$$StoolapValue_VectorImplCopyWith(_$StoolapValue_VectorImpl value,
          $Res Function(_$StoolapValue_VectorImpl) then) =
      __$$StoolapValue_VectorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Float32List field0});
}

/// @nodoc
class __$$StoolapValue_VectorImplCopyWithImpl<$Res>
    extends _$StoolapValueCopyWithImpl<$Res, _$StoolapValue_VectorImpl>
    implements _$$StoolapValue_VectorImplCopyWith<$Res> {
  __$$StoolapValue_VectorImplCopyWithImpl(_$StoolapValue_VectorImpl _value,
      $Res Function(_$StoolapValue_VectorImpl) _then)
      : super(_value, _then);

  /// Create a copy of StoolapValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$StoolapValue_VectorImpl(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as Float32List,
    ));
  }
}

/// @nodoc

class _$StoolapValue_VectorImpl extends StoolapValue_Vector {
  const _$StoolapValue_VectorImpl(this.field0) : super._();

  @override
  final Float32List field0;

  @override
  String toString() {
    return 'StoolapValue.vector(field0: $field0)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoolapValue_VectorImpl &&
            const DeepCollectionEquality().equals(other.field0, field0));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(field0));

  /// Create a copy of StoolapValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoolapValue_VectorImplCopyWith<_$StoolapValue_VectorImpl> get copyWith =>
      __$$StoolapValue_VectorImplCopyWithImpl<_$StoolapValue_VectorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int field0) integer,
    required TResult Function(double field0) float,
    required TResult Function(String field0) text,
    required TResult Function(bool field0) boolean,
    required TResult Function(Float32List field0) vector,
    required TResult Function(String field0) json,
    required TResult Function(int field0) timestamp,
    required TResult Function(int field0) date,
    required TResult Function() null_,
  }) {
    return vector(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int field0)? integer,
    TResult? Function(double field0)? float,
    TResult? Function(String field0)? text,
    TResult? Function(bool field0)? boolean,
    TResult? Function(Float32List field0)? vector,
    TResult? Function(String field0)? json,
    TResult? Function(int field0)? timestamp,
    TResult? Function(int field0)? date,
    TResult? Function()? null_,
  }) {
    return vector?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int field0)? integer,
    TResult Function(double field0)? float,
    TResult Function(String field0)? text,
    TResult Function(bool field0)? boolean,
    TResult Function(Float32List field0)? vector,
    TResult Function(String field0)? json,
    TResult Function(int field0)? timestamp,
    TResult Function(int field0)? date,
    TResult Function()? null_,
    required TResult orElse(),
  }) {
    if (vector != null) {
      return vector(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StoolapValue_Integer value) integer,
    required TResult Function(StoolapValue_Float value) float,
    required TResult Function(StoolapValue_Text value) text,
    required TResult Function(StoolapValue_Boolean value) boolean,
    required TResult Function(StoolapValue_Vector value) vector,
    required TResult Function(StoolapValue_Json value) json,
    required TResult Function(StoolapValue_Timestamp value) timestamp,
    required TResult Function(StoolapValue_Date value) date,
    required TResult Function(StoolapValue_Null value) null_,
  }) {
    return vector(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StoolapValue_Integer value)? integer,
    TResult? Function(StoolapValue_Float value)? float,
    TResult? Function(StoolapValue_Text value)? text,
    TResult? Function(StoolapValue_Boolean value)? boolean,
    TResult? Function(StoolapValue_Vector value)? vector,
    TResult? Function(StoolapValue_Json value)? json,
    TResult? Function(StoolapValue_Timestamp value)? timestamp,
    TResult? Function(StoolapValue_Date value)? date,
    TResult? Function(StoolapValue_Null value)? null_,
  }) {
    return vector?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StoolapValue_Integer value)? integer,
    TResult Function(StoolapValue_Float value)? float,
    TResult Function(StoolapValue_Text value)? text,
    TResult Function(StoolapValue_Boolean value)? boolean,
    TResult Function(StoolapValue_Vector value)? vector,
    TResult Function(StoolapValue_Json value)? json,
    TResult Function(StoolapValue_Timestamp value)? timestamp,
    TResult Function(StoolapValue_Date value)? date,
    TResult Function(StoolapValue_Null value)? null_,
    required TResult orElse(),
  }) {
    if (vector != null) {
      return vector(this);
    }
    return orElse();
  }
}

abstract class StoolapValue_Vector extends StoolapValue {
  const factory StoolapValue_Vector(final Float32List field0) =
      _$StoolapValue_VectorImpl;
  const StoolapValue_Vector._() : super._();

  Float32List get field0;

  /// Create a copy of StoolapValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoolapValue_VectorImplCopyWith<_$StoolapValue_VectorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StoolapValue_JsonImplCopyWith<$Res> {
  factory _$$StoolapValue_JsonImplCopyWith(_$StoolapValue_JsonImpl value,
          $Res Function(_$StoolapValue_JsonImpl) then) =
      __$$StoolapValue_JsonImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String field0});
}

/// @nodoc
class __$$StoolapValue_JsonImplCopyWithImpl<$Res>
    extends _$StoolapValueCopyWithImpl<$Res, _$StoolapValue_JsonImpl>
    implements _$$StoolapValue_JsonImplCopyWith<$Res> {
  __$$StoolapValue_JsonImplCopyWithImpl(_$StoolapValue_JsonImpl _value,
      $Res Function(_$StoolapValue_JsonImpl) _then)
      : super(_value, _then);

  /// Create a copy of StoolapValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$StoolapValue_JsonImpl(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$StoolapValue_JsonImpl extends StoolapValue_Json {
  const _$StoolapValue_JsonImpl(this.field0) : super._();

  @override
  final String field0;

  @override
  String toString() {
    return 'StoolapValue.json(field0: $field0)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoolapValue_JsonImpl &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  /// Create a copy of StoolapValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoolapValue_JsonImplCopyWith<_$StoolapValue_JsonImpl> get copyWith =>
      __$$StoolapValue_JsonImplCopyWithImpl<_$StoolapValue_JsonImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int field0) integer,
    required TResult Function(double field0) float,
    required TResult Function(String field0) text,
    required TResult Function(bool field0) boolean,
    required TResult Function(Float32List field0) vector,
    required TResult Function(String field0) json,
    required TResult Function(int field0) timestamp,
    required TResult Function(int field0) date,
    required TResult Function() null_,
  }) {
    return json(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int field0)? integer,
    TResult? Function(double field0)? float,
    TResult? Function(String field0)? text,
    TResult? Function(bool field0)? boolean,
    TResult? Function(Float32List field0)? vector,
    TResult? Function(String field0)? json,
    TResult? Function(int field0)? timestamp,
    TResult? Function(int field0)? date,
    TResult? Function()? null_,
  }) {
    return json?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int field0)? integer,
    TResult Function(double field0)? float,
    TResult Function(String field0)? text,
    TResult Function(bool field0)? boolean,
    TResult Function(Float32List field0)? vector,
    TResult Function(String field0)? json,
    TResult Function(int field0)? timestamp,
    TResult Function(int field0)? date,
    TResult Function()? null_,
    required TResult orElse(),
  }) {
    if (json != null) {
      return json(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StoolapValue_Integer value) integer,
    required TResult Function(StoolapValue_Float value) float,
    required TResult Function(StoolapValue_Text value) text,
    required TResult Function(StoolapValue_Boolean value) boolean,
    required TResult Function(StoolapValue_Vector value) vector,
    required TResult Function(StoolapValue_Json value) json,
    required TResult Function(StoolapValue_Timestamp value) timestamp,
    required TResult Function(StoolapValue_Date value) date,
    required TResult Function(StoolapValue_Null value) null_,
  }) {
    return json(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StoolapValue_Integer value)? integer,
    TResult? Function(StoolapValue_Float value)? float,
    TResult? Function(StoolapValue_Text value)? text,
    TResult? Function(StoolapValue_Boolean value)? boolean,
    TResult? Function(StoolapValue_Vector value)? vector,
    TResult? Function(StoolapValue_Json value)? json,
    TResult? Function(StoolapValue_Timestamp value)? timestamp,
    TResult? Function(StoolapValue_Date value)? date,
    TResult? Function(StoolapValue_Null value)? null_,
  }) {
    return json?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StoolapValue_Integer value)? integer,
    TResult Function(StoolapValue_Float value)? float,
    TResult Function(StoolapValue_Text value)? text,
    TResult Function(StoolapValue_Boolean value)? boolean,
    TResult Function(StoolapValue_Vector value)? vector,
    TResult Function(StoolapValue_Json value)? json,
    TResult Function(StoolapValue_Timestamp value)? timestamp,
    TResult Function(StoolapValue_Date value)? date,
    TResult Function(StoolapValue_Null value)? null_,
    required TResult orElse(),
  }) {
    if (json != null) {
      return json(this);
    }
    return orElse();
  }
}

abstract class StoolapValue_Json extends StoolapValue {
  const factory StoolapValue_Json(final String field0) =
      _$StoolapValue_JsonImpl;
  const StoolapValue_Json._() : super._();

  String get field0;

  /// Create a copy of StoolapValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoolapValue_JsonImplCopyWith<_$StoolapValue_JsonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StoolapValue_TimestampImplCopyWith<$Res> {
  factory _$$StoolapValue_TimestampImplCopyWith(
          _$StoolapValue_TimestampImpl value,
          $Res Function(_$StoolapValue_TimestampImpl) then) =
      __$$StoolapValue_TimestampImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int field0});
}

/// @nodoc
class __$$StoolapValue_TimestampImplCopyWithImpl<$Res>
    extends _$StoolapValueCopyWithImpl<$Res, _$StoolapValue_TimestampImpl>
    implements _$$StoolapValue_TimestampImplCopyWith<$Res> {
  __$$StoolapValue_TimestampImplCopyWithImpl(
      _$StoolapValue_TimestampImpl _value,
      $Res Function(_$StoolapValue_TimestampImpl) _then)
      : super(_value, _then);

  /// Create a copy of StoolapValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$StoolapValue_TimestampImpl(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$StoolapValue_TimestampImpl extends StoolapValue_Timestamp {
  const _$StoolapValue_TimestampImpl(this.field0) : super._();

  @override
  final int field0;

  @override
  String toString() {
    return 'StoolapValue.timestamp(field0: $field0)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoolapValue_TimestampImpl &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  /// Create a copy of StoolapValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoolapValue_TimestampImplCopyWith<_$StoolapValue_TimestampImpl>
      get copyWith => __$$StoolapValue_TimestampImplCopyWithImpl<
          _$StoolapValue_TimestampImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int field0) integer,
    required TResult Function(double field0) float,
    required TResult Function(String field0) text,
    required TResult Function(bool field0) boolean,
    required TResult Function(Float32List field0) vector,
    required TResult Function(String field0) json,
    required TResult Function(int field0) timestamp,
    required TResult Function(int field0) date,
    required TResult Function() null_,
  }) {
    return timestamp(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int field0)? integer,
    TResult? Function(double field0)? float,
    TResult? Function(String field0)? text,
    TResult? Function(bool field0)? boolean,
    TResult? Function(Float32List field0)? vector,
    TResult? Function(String field0)? json,
    TResult? Function(int field0)? timestamp,
    TResult? Function(int field0)? date,
    TResult? Function()? null_,
  }) {
    return timestamp?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int field0)? integer,
    TResult Function(double field0)? float,
    TResult Function(String field0)? text,
    TResult Function(bool field0)? boolean,
    TResult Function(Float32List field0)? vector,
    TResult Function(String field0)? json,
    TResult Function(int field0)? timestamp,
    TResult Function(int field0)? date,
    TResult Function()? null_,
    required TResult orElse(),
  }) {
    if (timestamp != null) {
      return timestamp(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StoolapValue_Integer value) integer,
    required TResult Function(StoolapValue_Float value) float,
    required TResult Function(StoolapValue_Text value) text,
    required TResult Function(StoolapValue_Boolean value) boolean,
    required TResult Function(StoolapValue_Vector value) vector,
    required TResult Function(StoolapValue_Json value) json,
    required TResult Function(StoolapValue_Timestamp value) timestamp,
    required TResult Function(StoolapValue_Date value) date,
    required TResult Function(StoolapValue_Null value) null_,
  }) {
    return timestamp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StoolapValue_Integer value)? integer,
    TResult? Function(StoolapValue_Float value)? float,
    TResult? Function(StoolapValue_Text value)? text,
    TResult? Function(StoolapValue_Boolean value)? boolean,
    TResult? Function(StoolapValue_Vector value)? vector,
    TResult? Function(StoolapValue_Json value)? json,
    TResult? Function(StoolapValue_Timestamp value)? timestamp,
    TResult? Function(StoolapValue_Date value)? date,
    TResult? Function(StoolapValue_Null value)? null_,
  }) {
    return timestamp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StoolapValue_Integer value)? integer,
    TResult Function(StoolapValue_Float value)? float,
    TResult Function(StoolapValue_Text value)? text,
    TResult Function(StoolapValue_Boolean value)? boolean,
    TResult Function(StoolapValue_Vector value)? vector,
    TResult Function(StoolapValue_Json value)? json,
    TResult Function(StoolapValue_Timestamp value)? timestamp,
    TResult Function(StoolapValue_Date value)? date,
    TResult Function(StoolapValue_Null value)? null_,
    required TResult orElse(),
  }) {
    if (timestamp != null) {
      return timestamp(this);
    }
    return orElse();
  }
}

abstract class StoolapValue_Timestamp extends StoolapValue {
  const factory StoolapValue_Timestamp(final int field0) =
      _$StoolapValue_TimestampImpl;
  const StoolapValue_Timestamp._() : super._();

  int get field0;

  /// Create a copy of StoolapValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoolapValue_TimestampImplCopyWith<_$StoolapValue_TimestampImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StoolapValue_DateImplCopyWith<$Res> {
  factory _$$StoolapValue_DateImplCopyWith(_$StoolapValue_DateImpl value,
          $Res Function(_$StoolapValue_DateImpl) then) =
      __$$StoolapValue_DateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int field0});
}

/// @nodoc
class __$$StoolapValue_DateImplCopyWithImpl<$Res>
    extends _$StoolapValueCopyWithImpl<$Res, _$StoolapValue_DateImpl>
    implements _$$StoolapValue_DateImplCopyWith<$Res> {
  __$$StoolapValue_DateImplCopyWithImpl(_$StoolapValue_DateImpl _value,
      $Res Function(_$StoolapValue_DateImpl) _then)
      : super(_value, _then);

  /// Create a copy of StoolapValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$StoolapValue_DateImpl(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$StoolapValue_DateImpl extends StoolapValue_Date {
  const _$StoolapValue_DateImpl(this.field0) : super._();

  @override
  final int field0;

  @override
  String toString() {
    return 'StoolapValue.date(field0: $field0)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoolapValue_DateImpl &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  /// Create a copy of StoolapValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoolapValue_DateImplCopyWith<_$StoolapValue_DateImpl> get copyWith =>
      __$$StoolapValue_DateImplCopyWithImpl<_$StoolapValue_DateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int field0) integer,
    required TResult Function(double field0) float,
    required TResult Function(String field0) text,
    required TResult Function(bool field0) boolean,
    required TResult Function(Float32List field0) vector,
    required TResult Function(String field0) json,
    required TResult Function(int field0) timestamp,
    required TResult Function(int field0) date,
    required TResult Function() null_,
  }) {
    return date(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int field0)? integer,
    TResult? Function(double field0)? float,
    TResult? Function(String field0)? text,
    TResult? Function(bool field0)? boolean,
    TResult? Function(Float32List field0)? vector,
    TResult? Function(String field0)? json,
    TResult? Function(int field0)? timestamp,
    TResult? Function(int field0)? date,
    TResult? Function()? null_,
  }) {
    return date?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int field0)? integer,
    TResult Function(double field0)? float,
    TResult Function(String field0)? text,
    TResult Function(bool field0)? boolean,
    TResult Function(Float32List field0)? vector,
    TResult Function(String field0)? json,
    TResult Function(int field0)? timestamp,
    TResult Function(int field0)? date,
    TResult Function()? null_,
    required TResult orElse(),
  }) {
    if (date != null) {
      return date(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StoolapValue_Integer value) integer,
    required TResult Function(StoolapValue_Float value) float,
    required TResult Function(StoolapValue_Text value) text,
    required TResult Function(StoolapValue_Boolean value) boolean,
    required TResult Function(StoolapValue_Vector value) vector,
    required TResult Function(StoolapValue_Json value) json,
    required TResult Function(StoolapValue_Timestamp value) timestamp,
    required TResult Function(StoolapValue_Date value) date,
    required TResult Function(StoolapValue_Null value) null_,
  }) {
    return date(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StoolapValue_Integer value)? integer,
    TResult? Function(StoolapValue_Float value)? float,
    TResult? Function(StoolapValue_Text value)? text,
    TResult? Function(StoolapValue_Boolean value)? boolean,
    TResult? Function(StoolapValue_Vector value)? vector,
    TResult? Function(StoolapValue_Json value)? json,
    TResult? Function(StoolapValue_Timestamp value)? timestamp,
    TResult? Function(StoolapValue_Date value)? date,
    TResult? Function(StoolapValue_Null value)? null_,
  }) {
    return date?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StoolapValue_Integer value)? integer,
    TResult Function(StoolapValue_Float value)? float,
    TResult Function(StoolapValue_Text value)? text,
    TResult Function(StoolapValue_Boolean value)? boolean,
    TResult Function(StoolapValue_Vector value)? vector,
    TResult Function(StoolapValue_Json value)? json,
    TResult Function(StoolapValue_Timestamp value)? timestamp,
    TResult Function(StoolapValue_Date value)? date,
    TResult Function(StoolapValue_Null value)? null_,
    required TResult orElse(),
  }) {
    if (date != null) {
      return date(this);
    }
    return orElse();
  }
}

abstract class StoolapValue_Date extends StoolapValue {
  const factory StoolapValue_Date(final int field0) = _$StoolapValue_DateImpl;
  const StoolapValue_Date._() : super._();

  int get field0;

  /// Create a copy of StoolapValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoolapValue_DateImplCopyWith<_$StoolapValue_DateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StoolapValue_NullImplCopyWith<$Res> {
  factory _$$StoolapValue_NullImplCopyWith(_$StoolapValue_NullImpl value,
          $Res Function(_$StoolapValue_NullImpl) then) =
      __$$StoolapValue_NullImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StoolapValue_NullImplCopyWithImpl<$Res>
    extends _$StoolapValueCopyWithImpl<$Res, _$StoolapValue_NullImpl>
    implements _$$StoolapValue_NullImplCopyWith<$Res> {
  __$$StoolapValue_NullImplCopyWithImpl(_$StoolapValue_NullImpl _value,
      $Res Function(_$StoolapValue_NullImpl) _then)
      : super(_value, _then);

  /// Create a copy of StoolapValue
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StoolapValue_NullImpl extends StoolapValue_Null {
  const _$StoolapValue_NullImpl() : super._();

  @override
  String toString() {
    return 'StoolapValue.null_()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StoolapValue_NullImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int field0) integer,
    required TResult Function(double field0) float,
    required TResult Function(String field0) text,
    required TResult Function(bool field0) boolean,
    required TResult Function(Float32List field0) vector,
    required TResult Function(String field0) json,
    required TResult Function(int field0) timestamp,
    required TResult Function(int field0) date,
    required TResult Function() null_,
  }) {
    return null_();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int field0)? integer,
    TResult? Function(double field0)? float,
    TResult? Function(String field0)? text,
    TResult? Function(bool field0)? boolean,
    TResult? Function(Float32List field0)? vector,
    TResult? Function(String field0)? json,
    TResult? Function(int field0)? timestamp,
    TResult? Function(int field0)? date,
    TResult? Function()? null_,
  }) {
    return null_?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int field0)? integer,
    TResult Function(double field0)? float,
    TResult Function(String field0)? text,
    TResult Function(bool field0)? boolean,
    TResult Function(Float32List field0)? vector,
    TResult Function(String field0)? json,
    TResult Function(int field0)? timestamp,
    TResult Function(int field0)? date,
    TResult Function()? null_,
    required TResult orElse(),
  }) {
    if (null_ != null) {
      return null_();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StoolapValue_Integer value) integer,
    required TResult Function(StoolapValue_Float value) float,
    required TResult Function(StoolapValue_Text value) text,
    required TResult Function(StoolapValue_Boolean value) boolean,
    required TResult Function(StoolapValue_Vector value) vector,
    required TResult Function(StoolapValue_Json value) json,
    required TResult Function(StoolapValue_Timestamp value) timestamp,
    required TResult Function(StoolapValue_Date value) date,
    required TResult Function(StoolapValue_Null value) null_,
  }) {
    return null_(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StoolapValue_Integer value)? integer,
    TResult? Function(StoolapValue_Float value)? float,
    TResult? Function(StoolapValue_Text value)? text,
    TResult? Function(StoolapValue_Boolean value)? boolean,
    TResult? Function(StoolapValue_Vector value)? vector,
    TResult? Function(StoolapValue_Json value)? json,
    TResult? Function(StoolapValue_Timestamp value)? timestamp,
    TResult? Function(StoolapValue_Date value)? date,
    TResult? Function(StoolapValue_Null value)? null_,
  }) {
    return null_?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StoolapValue_Integer value)? integer,
    TResult Function(StoolapValue_Float value)? float,
    TResult Function(StoolapValue_Text value)? text,
    TResult Function(StoolapValue_Boolean value)? boolean,
    TResult Function(StoolapValue_Vector value)? vector,
    TResult Function(StoolapValue_Json value)? json,
    TResult Function(StoolapValue_Timestamp value)? timestamp,
    TResult Function(StoolapValue_Date value)? date,
    TResult Function(StoolapValue_Null value)? null_,
    required TResult orElse(),
  }) {
    if (null_ != null) {
      return null_(this);
    }
    return orElse();
  }
}

abstract class StoolapValue_Null extends StoolapValue {
  const factory StoolapValue_Null() = _$StoolapValue_NullImpl;
  const StoolapValue_Null._() : super._();
}
