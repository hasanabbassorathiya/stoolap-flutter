// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'db.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StoolapValue {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is StoolapValue);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'StoolapValue()';
  }
}

/// @nodoc
class $StoolapValueCopyWith<$Res> {
  $StoolapValueCopyWith(StoolapValue _, $Res Function(StoolapValue) __);
}

/// Adds pattern-matching-related methods to [StoolapValue].
extension StoolapValuePatterns on StoolapValue {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

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
    final _that = this;
    switch (_that) {
      case StoolapValue_Integer() when integer != null:
        return integer(_that);
      case StoolapValue_Float() when float != null:
        return float(_that);
      case StoolapValue_Text() when text != null:
        return text(_that);
      case StoolapValue_Boolean() when boolean != null:
        return boolean(_that);
      case StoolapValue_Vector() when vector != null:
        return vector(_that);
      case StoolapValue_Json() when json != null:
        return json(_that);
      case StoolapValue_Timestamp() when timestamp != null:
        return timestamp(_that);
      case StoolapValue_Date() when date != null:
        return date(_that);
      case StoolapValue_Null() when null_ != null:
        return null_(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

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
    final _that = this;
    switch (_that) {
      case StoolapValue_Integer():
        return integer(_that);
      case StoolapValue_Float():
        return float(_that);
      case StoolapValue_Text():
        return text(_that);
      case StoolapValue_Boolean():
        return boolean(_that);
      case StoolapValue_Vector():
        return vector(_that);
      case StoolapValue_Json():
        return json(_that);
      case StoolapValue_Timestamp():
        return timestamp(_that);
      case StoolapValue_Date():
        return date(_that);
      case StoolapValue_Null():
        return null_(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

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
    final _that = this;
    switch (_that) {
      case StoolapValue_Integer() when integer != null:
        return integer(_that);
      case StoolapValue_Float() when float != null:
        return float(_that);
      case StoolapValue_Text() when text != null:
        return text(_that);
      case StoolapValue_Boolean() when boolean != null:
        return boolean(_that);
      case StoolapValue_Vector() when vector != null:
        return vector(_that);
      case StoolapValue_Json() when json != null:
        return json(_that);
      case StoolapValue_Timestamp() when timestamp != null:
        return timestamp(_that);
      case StoolapValue_Date() when date != null:
        return date(_that);
      case StoolapValue_Null() when null_ != null:
        return null_(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PlatformInt64 field0)? integer,
    TResult Function(double field0)? float,
    TResult Function(String field0)? text,
    TResult Function(bool field0)? boolean,
    TResult Function(Float32List field0)? vector,
    TResult Function(String field0)? json,
    TResult Function(PlatformInt64 field0)? timestamp,
    TResult Function(PlatformInt64 field0)? date,
    TResult Function()? null_,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case StoolapValue_Integer() when integer != null:
        return integer(_that.field0);
      case StoolapValue_Float() when float != null:
        return float(_that.field0);
      case StoolapValue_Text() when text != null:
        return text(_that.field0);
      case StoolapValue_Boolean() when boolean != null:
        return boolean(_that.field0);
      case StoolapValue_Vector() when vector != null:
        return vector(_that.field0);
      case StoolapValue_Json() when json != null:
        return json(_that.field0);
      case StoolapValue_Timestamp() when timestamp != null:
        return timestamp(_that.field0);
      case StoolapValue_Date() when date != null:
        return date(_that.field0);
      case StoolapValue_Null() when null_ != null:
        return null_();
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PlatformInt64 field0) integer,
    required TResult Function(double field0) float,
    required TResult Function(String field0) text,
    required TResult Function(bool field0) boolean,
    required TResult Function(Float32List field0) vector,
    required TResult Function(String field0) json,
    required TResult Function(PlatformInt64 field0) timestamp,
    required TResult Function(PlatformInt64 field0) date,
    required TResult Function() null_,
  }) {
    final _that = this;
    switch (_that) {
      case StoolapValue_Integer():
        return integer(_that.field0);
      case StoolapValue_Float():
        return float(_that.field0);
      case StoolapValue_Text():
        return text(_that.field0);
      case StoolapValue_Boolean():
        return boolean(_that.field0);
      case StoolapValue_Vector():
        return vector(_that.field0);
      case StoolapValue_Json():
        return json(_that.field0);
      case StoolapValue_Timestamp():
        return timestamp(_that.field0);
      case StoolapValue_Date():
        return date(_that.field0);
      case StoolapValue_Null():
        return null_();
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PlatformInt64 field0)? integer,
    TResult? Function(double field0)? float,
    TResult? Function(String field0)? text,
    TResult? Function(bool field0)? boolean,
    TResult? Function(Float32List field0)? vector,
    TResult? Function(String field0)? json,
    TResult? Function(PlatformInt64 field0)? timestamp,
    TResult? Function(PlatformInt64 field0)? date,
    TResult? Function()? null_,
  }) {
    final _that = this;
    switch (_that) {
      case StoolapValue_Integer() when integer != null:
        return integer(_that.field0);
      case StoolapValue_Float() when float != null:
        return float(_that.field0);
      case StoolapValue_Text() when text != null:
        return text(_that.field0);
      case StoolapValue_Boolean() when boolean != null:
        return boolean(_that.field0);
      case StoolapValue_Vector() when vector != null:
        return vector(_that.field0);
      case StoolapValue_Json() when json != null:
        return json(_that.field0);
      case StoolapValue_Timestamp() when timestamp != null:
        return timestamp(_that.field0);
      case StoolapValue_Date() when date != null:
        return date(_that.field0);
      case StoolapValue_Null() when null_ != null:
        return null_();
      case _:
        return null;
    }
  }
}

/// @nodoc

class StoolapValue_Integer extends StoolapValue {
  const StoolapValue_Integer(this.field0) : super._();

  final PlatformInt64 field0;

  /// Create a copy of StoolapValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StoolapValue_IntegerCopyWith<StoolapValue_Integer> get copyWith =>
      _$StoolapValue_IntegerCopyWithImpl<StoolapValue_Integer>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StoolapValue_Integer &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @override
  String toString() {
    return 'StoolapValue.integer(field0: $field0)';
  }
}

/// @nodoc
abstract mixin class $StoolapValue_IntegerCopyWith<$Res>
    implements $StoolapValueCopyWith<$Res> {
  factory $StoolapValue_IntegerCopyWith(StoolapValue_Integer value,
          $Res Function(StoolapValue_Integer) _then) =
      _$StoolapValue_IntegerCopyWithImpl;
  @useResult
  $Res call({PlatformInt64 field0});
}

/// @nodoc
class _$StoolapValue_IntegerCopyWithImpl<$Res>
    implements $StoolapValue_IntegerCopyWith<$Res> {
  _$StoolapValue_IntegerCopyWithImpl(this._self, this._then);

  final StoolapValue_Integer _self;
  final $Res Function(StoolapValue_Integer) _then;

  /// Create a copy of StoolapValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? field0 = null,
  }) {
    return _then(StoolapValue_Integer(
      null == field0
          ? _self.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as PlatformInt64,
    ));
  }
}

/// @nodoc

class StoolapValue_Float extends StoolapValue {
  const StoolapValue_Float(this.field0) : super._();

  final double field0;

  /// Create a copy of StoolapValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StoolapValue_FloatCopyWith<StoolapValue_Float> get copyWith =>
      _$StoolapValue_FloatCopyWithImpl<StoolapValue_Float>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StoolapValue_Float &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @override
  String toString() {
    return 'StoolapValue.float(field0: $field0)';
  }
}

/// @nodoc
abstract mixin class $StoolapValue_FloatCopyWith<$Res>
    implements $StoolapValueCopyWith<$Res> {
  factory $StoolapValue_FloatCopyWith(
          StoolapValue_Float value, $Res Function(StoolapValue_Float) _then) =
      _$StoolapValue_FloatCopyWithImpl;
  @useResult
  $Res call({double field0});
}

/// @nodoc
class _$StoolapValue_FloatCopyWithImpl<$Res>
    implements $StoolapValue_FloatCopyWith<$Res> {
  _$StoolapValue_FloatCopyWithImpl(this._self, this._then);

  final StoolapValue_Float _self;
  final $Res Function(StoolapValue_Float) _then;

  /// Create a copy of StoolapValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? field0 = null,
  }) {
    return _then(StoolapValue_Float(
      null == field0
          ? _self.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class StoolapValue_Text extends StoolapValue {
  const StoolapValue_Text(this.field0) : super._();

  final String field0;

  /// Create a copy of StoolapValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StoolapValue_TextCopyWith<StoolapValue_Text> get copyWith =>
      _$StoolapValue_TextCopyWithImpl<StoolapValue_Text>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StoolapValue_Text &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @override
  String toString() {
    return 'StoolapValue.text(field0: $field0)';
  }
}

/// @nodoc
abstract mixin class $StoolapValue_TextCopyWith<$Res>
    implements $StoolapValueCopyWith<$Res> {
  factory $StoolapValue_TextCopyWith(
          StoolapValue_Text value, $Res Function(StoolapValue_Text) _then) =
      _$StoolapValue_TextCopyWithImpl;
  @useResult
  $Res call({String field0});
}

/// @nodoc
class _$StoolapValue_TextCopyWithImpl<$Res>
    implements $StoolapValue_TextCopyWith<$Res> {
  _$StoolapValue_TextCopyWithImpl(this._self, this._then);

  final StoolapValue_Text _self;
  final $Res Function(StoolapValue_Text) _then;

  /// Create a copy of StoolapValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? field0 = null,
  }) {
    return _then(StoolapValue_Text(
      null == field0
          ? _self.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class StoolapValue_Boolean extends StoolapValue {
  const StoolapValue_Boolean(this.field0) : super._();

  final bool field0;

  /// Create a copy of StoolapValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StoolapValue_BooleanCopyWith<StoolapValue_Boolean> get copyWith =>
      _$StoolapValue_BooleanCopyWithImpl<StoolapValue_Boolean>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StoolapValue_Boolean &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @override
  String toString() {
    return 'StoolapValue.boolean(field0: $field0)';
  }
}

/// @nodoc
abstract mixin class $StoolapValue_BooleanCopyWith<$Res>
    implements $StoolapValueCopyWith<$Res> {
  factory $StoolapValue_BooleanCopyWith(StoolapValue_Boolean value,
          $Res Function(StoolapValue_Boolean) _then) =
      _$StoolapValue_BooleanCopyWithImpl;
  @useResult
  $Res call({bool field0});
}

/// @nodoc
class _$StoolapValue_BooleanCopyWithImpl<$Res>
    implements $StoolapValue_BooleanCopyWith<$Res> {
  _$StoolapValue_BooleanCopyWithImpl(this._self, this._then);

  final StoolapValue_Boolean _self;
  final $Res Function(StoolapValue_Boolean) _then;

  /// Create a copy of StoolapValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? field0 = null,
  }) {
    return _then(StoolapValue_Boolean(
      null == field0
          ? _self.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class StoolapValue_Vector extends StoolapValue {
  const StoolapValue_Vector(this.field0) : super._();

  final Float32List field0;

  /// Create a copy of StoolapValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StoolapValue_VectorCopyWith<StoolapValue_Vector> get copyWith =>
      _$StoolapValue_VectorCopyWithImpl<StoolapValue_Vector>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StoolapValue_Vector &&
            const DeepCollectionEquality().equals(other.field0, field0));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(field0));

  @override
  String toString() {
    return 'StoolapValue.vector(field0: $field0)';
  }
}

/// @nodoc
abstract mixin class $StoolapValue_VectorCopyWith<$Res>
    implements $StoolapValueCopyWith<$Res> {
  factory $StoolapValue_VectorCopyWith(
          StoolapValue_Vector value, $Res Function(StoolapValue_Vector) _then) =
      _$StoolapValue_VectorCopyWithImpl;
  @useResult
  $Res call({Float32List field0});
}

/// @nodoc
class _$StoolapValue_VectorCopyWithImpl<$Res>
    implements $StoolapValue_VectorCopyWith<$Res> {
  _$StoolapValue_VectorCopyWithImpl(this._self, this._then);

  final StoolapValue_Vector _self;
  final $Res Function(StoolapValue_Vector) _then;

  /// Create a copy of StoolapValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? field0 = null,
  }) {
    return _then(StoolapValue_Vector(
      null == field0
          ? _self.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as Float32List,
    ));
  }
}

/// @nodoc

class StoolapValue_Json extends StoolapValue {
  const StoolapValue_Json(this.field0) : super._();

  final String field0;

  /// Create a copy of StoolapValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StoolapValue_JsonCopyWith<StoolapValue_Json> get copyWith =>
      _$StoolapValue_JsonCopyWithImpl<StoolapValue_Json>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StoolapValue_Json &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @override
  String toString() {
    return 'StoolapValue.json(field0: $field0)';
  }
}

/// @nodoc
abstract mixin class $StoolapValue_JsonCopyWith<$Res>
    implements $StoolapValueCopyWith<$Res> {
  factory $StoolapValue_JsonCopyWith(
          StoolapValue_Json value, $Res Function(StoolapValue_Json) _then) =
      _$StoolapValue_JsonCopyWithImpl;
  @useResult
  $Res call({String field0});
}

/// @nodoc
class _$StoolapValue_JsonCopyWithImpl<$Res>
    implements $StoolapValue_JsonCopyWith<$Res> {
  _$StoolapValue_JsonCopyWithImpl(this._self, this._then);

  final StoolapValue_Json _self;
  final $Res Function(StoolapValue_Json) _then;

  /// Create a copy of StoolapValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? field0 = null,
  }) {
    return _then(StoolapValue_Json(
      null == field0
          ? _self.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class StoolapValue_Timestamp extends StoolapValue {
  const StoolapValue_Timestamp(this.field0) : super._();

  final PlatformInt64 field0;

  /// Create a copy of StoolapValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StoolapValue_TimestampCopyWith<StoolapValue_Timestamp> get copyWith =>
      _$StoolapValue_TimestampCopyWithImpl<StoolapValue_Timestamp>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StoolapValue_Timestamp &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @override
  String toString() {
    return 'StoolapValue.timestamp(field0: $field0)';
  }
}

/// @nodoc
abstract mixin class $StoolapValue_TimestampCopyWith<$Res>
    implements $StoolapValueCopyWith<$Res> {
  factory $StoolapValue_TimestampCopyWith(StoolapValue_Timestamp value,
          $Res Function(StoolapValue_Timestamp) _then) =
      _$StoolapValue_TimestampCopyWithImpl;
  @useResult
  $Res call({PlatformInt64 field0});
}

/// @nodoc
class _$StoolapValue_TimestampCopyWithImpl<$Res>
    implements $StoolapValue_TimestampCopyWith<$Res> {
  _$StoolapValue_TimestampCopyWithImpl(this._self, this._then);

  final StoolapValue_Timestamp _self;
  final $Res Function(StoolapValue_Timestamp) _then;

  /// Create a copy of StoolapValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? field0 = null,
  }) {
    return _then(StoolapValue_Timestamp(
      null == field0
          ? _self.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as PlatformInt64,
    ));
  }
}

/// @nodoc

class StoolapValue_Date extends StoolapValue {
  const StoolapValue_Date(this.field0) : super._();

  final PlatformInt64 field0;

  /// Create a copy of StoolapValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StoolapValue_DateCopyWith<StoolapValue_Date> get copyWith =>
      _$StoolapValue_DateCopyWithImpl<StoolapValue_Date>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StoolapValue_Date &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @override
  String toString() {
    return 'StoolapValue.date(field0: $field0)';
  }
}

/// @nodoc
abstract mixin class $StoolapValue_DateCopyWith<$Res>
    implements $StoolapValueCopyWith<$Res> {
  factory $StoolapValue_DateCopyWith(
          StoolapValue_Date value, $Res Function(StoolapValue_Date) _then) =
      _$StoolapValue_DateCopyWithImpl;
  @useResult
  $Res call({PlatformInt64 field0});
}

/// @nodoc
class _$StoolapValue_DateCopyWithImpl<$Res>
    implements $StoolapValue_DateCopyWith<$Res> {
  _$StoolapValue_DateCopyWithImpl(this._self, this._then);

  final StoolapValue_Date _self;
  final $Res Function(StoolapValue_Date) _then;

  /// Create a copy of StoolapValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? field0 = null,
  }) {
    return _then(StoolapValue_Date(
      null == field0
          ? _self.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as PlatformInt64,
    ));
  }
}

/// @nodoc

class StoolapValue_Null extends StoolapValue {
  const StoolapValue_Null() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is StoolapValue_Null);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'StoolapValue.null_()';
  }
}

// dart format on
