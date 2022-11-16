// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'TotalAmount.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TotalAmount _$TotalAmountFromJson(Map<String, dynamic> json) {
  return _TotalAmount.fromJson(json);
}

/// @nodoc
mixin _$TotalAmount {
  int get total => throw _privateConstructorUsedError;
  set total(int value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TotalAmountCopyWith<TotalAmount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TotalAmountCopyWith<$Res> {
  factory $TotalAmountCopyWith(
          TotalAmount value, $Res Function(TotalAmount) then) =
      _$TotalAmountCopyWithImpl<$Res, TotalAmount>;
  @useResult
  $Res call({int total});
}

/// @nodoc
class _$TotalAmountCopyWithImpl<$Res, $Val extends TotalAmount>
    implements $TotalAmountCopyWith<$Res> {
  _$TotalAmountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TotalAmountCopyWith<$Res>
    implements $TotalAmountCopyWith<$Res> {
  factory _$$_TotalAmountCopyWith(
          _$_TotalAmount value, $Res Function(_$_TotalAmount) then) =
      __$$_TotalAmountCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int total});
}

/// @nodoc
class __$$_TotalAmountCopyWithImpl<$Res>
    extends _$TotalAmountCopyWithImpl<$Res, _$_TotalAmount>
    implements _$$_TotalAmountCopyWith<$Res> {
  __$$_TotalAmountCopyWithImpl(
      _$_TotalAmount _value, $Res Function(_$_TotalAmount) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
  }) {
    return _then(_$_TotalAmount(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TotalAmount implements _TotalAmount {
  _$_TotalAmount({required this.total});

  factory _$_TotalAmount.fromJson(Map<String, dynamic> json) =>
      _$$_TotalAmountFromJson(json);

  @override
  int total;

  @override
  String toString() {
    return 'TotalAmount(total: $total)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TotalAmountCopyWith<_$_TotalAmount> get copyWith =>
      __$$_TotalAmountCopyWithImpl<_$_TotalAmount>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TotalAmountToJson(
      this,
    );
  }
}

abstract class _TotalAmount implements TotalAmount {
  factory _TotalAmount({required int total}) = _$_TotalAmount;

  factory _TotalAmount.fromJson(Map<String, dynamic> json) =
      _$_TotalAmount.fromJson;

  @override
  int get total;
  set total(int value);
  @override
  @JsonKey(ignore: true)
  _$$_TotalAmountCopyWith<_$_TotalAmount> get copyWith =>
      throw _privateConstructorUsedError;
}
