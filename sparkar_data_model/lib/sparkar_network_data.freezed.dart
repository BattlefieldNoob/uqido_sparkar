// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sparkar_network_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SparkARNetworkDataTearOff {
  const _$SparkARNetworkDataTearOff();

  _SparkARNetworkData call(
      List<SparkARUser> users, List<SparkAREffect> effects) {
    return _SparkARNetworkData(
      users,
      effects,
    );
  }
}

/// @nodoc
const $SparkARNetworkData = _$SparkARNetworkDataTearOff();

/// @nodoc
mixin _$SparkARNetworkData {
  List<SparkARUser> get users => throw _privateConstructorUsedError;
  List<SparkAREffect> get effects => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SparkARNetworkDataCopyWith<SparkARNetworkData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SparkARNetworkDataCopyWith<$Res> {
  factory $SparkARNetworkDataCopyWith(
          SparkARNetworkData value, $Res Function(SparkARNetworkData) then) =
      _$SparkARNetworkDataCopyWithImpl<$Res>;
  $Res call({List<SparkARUser> users, List<SparkAREffect> effects});
}

/// @nodoc
class _$SparkARNetworkDataCopyWithImpl<$Res>
    implements $SparkARNetworkDataCopyWith<$Res> {
  _$SparkARNetworkDataCopyWithImpl(this._value, this._then);

  final SparkARNetworkData _value;
  // ignore: unused_field
  final $Res Function(SparkARNetworkData) _then;

  @override
  $Res call({
    Object? users = freezed,
    Object? effects = freezed,
  }) {
    return _then(_value.copyWith(
      users: users == freezed
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<SparkARUser>,
      effects: effects == freezed
          ? _value.effects
          : effects // ignore: cast_nullable_to_non_nullable
              as List<SparkAREffect>,
    ));
  }
}

/// @nodoc
abstract class _$SparkARNetworkDataCopyWith<$Res>
    implements $SparkARNetworkDataCopyWith<$Res> {
  factory _$SparkARNetworkDataCopyWith(
          _SparkARNetworkData value, $Res Function(_SparkARNetworkData) then) =
      __$SparkARNetworkDataCopyWithImpl<$Res>;
  @override
  $Res call({List<SparkARUser> users, List<SparkAREffect> effects});
}

/// @nodoc
class __$SparkARNetworkDataCopyWithImpl<$Res>
    extends _$SparkARNetworkDataCopyWithImpl<$Res>
    implements _$SparkARNetworkDataCopyWith<$Res> {
  __$SparkARNetworkDataCopyWithImpl(
      _SparkARNetworkData _value, $Res Function(_SparkARNetworkData) _then)
      : super(_value, (v) => _then(v as _SparkARNetworkData));

  @override
  _SparkARNetworkData get _value => super._value as _SparkARNetworkData;

  @override
  $Res call({
    Object? users = freezed,
    Object? effects = freezed,
  }) {
    return _then(_SparkARNetworkData(
      users == freezed
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<SparkARUser>,
      effects == freezed
          ? _value.effects
          : effects // ignore: cast_nullable_to_non_nullable
              as List<SparkAREffect>,
    ));
  }
}

/// @nodoc

class _$_SparkARNetworkData implements _SparkARNetworkData {
  _$_SparkARNetworkData(this.users, this.effects);

  @override
  final List<SparkARUser> users;
  @override
  final List<SparkAREffect> effects;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SparkARNetworkData &&
            (identical(other.users, users) ||
                const DeepCollectionEquality().equals(other.users, users)) &&
            (identical(other.effects, effects) ||
                const DeepCollectionEquality().equals(other.effects, effects)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(users) ^
      const DeepCollectionEquality().hash(effects);

  @JsonKey(ignore: true)
  @override
  _$SparkARNetworkDataCopyWith<_SparkARNetworkData> get copyWith =>
      __$SparkARNetworkDataCopyWithImpl<_SparkARNetworkData>(this, _$identity);
}

abstract class _SparkARNetworkData implements SparkARNetworkData {
  factory _SparkARNetworkData(
          List<SparkARUser> users, List<SparkAREffect> effects) =
      _$_SparkARNetworkData;

  @override
  List<SparkARUser> get users => throw _privateConstructorUsedError;
  @override
  List<SparkAREffect> get effects => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SparkARNetworkDataCopyWith<_SparkARNetworkData> get copyWith =>
      throw _privateConstructorUsedError;
}
