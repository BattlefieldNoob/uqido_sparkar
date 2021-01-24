// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'sparkar_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
SparkARUser _$SparkARUserFromJson(Map<String, dynamic> json) {
  return _SparkARUser.fromJson(json);
}

/// @nodoc
class _$SparkARUserTearOff {
  const _$SparkARUserTearOff();

// ignore: unused_element
  _SparkARUser call(
      String id, String name, String iconUrl, List<SparkAREffect> effects) {
    return _SparkARUser(
      id,
      name,
      iconUrl,
      effects,
    );
  }

// ignore: unused_element
  SparkARUser fromJson(Map<String, Object> json) {
    return SparkARUser.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $SparkARUser = _$SparkARUserTearOff();

/// @nodoc
mixin _$SparkARUser {
  String get id;
  String get name;
  String get iconUrl;
  List<SparkAREffect> get effects;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $SparkARUserCopyWith<SparkARUser> get copyWith;
}

/// @nodoc
abstract class $SparkARUserCopyWith<$Res> {
  factory $SparkARUserCopyWith(
          SparkARUser value, $Res Function(SparkARUser) then) =
      _$SparkARUserCopyWithImpl<$Res>;
  $Res call(
      {String id, String name, String iconUrl, List<SparkAREffect> effects});
}

/// @nodoc
class _$SparkARUserCopyWithImpl<$Res> implements $SparkARUserCopyWith<$Res> {
  _$SparkARUserCopyWithImpl(this._value, this._then);

  final SparkARUser _value;
  // ignore: unused_field
  final $Res Function(SparkARUser) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object iconUrl = freezed,
    Object effects = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      iconUrl: iconUrl == freezed ? _value.iconUrl : iconUrl as String,
      effects:
          effects == freezed ? _value.effects : effects as List<SparkAREffect>,
    ));
  }
}

/// @nodoc
abstract class _$SparkARUserCopyWith<$Res>
    implements $SparkARUserCopyWith<$Res> {
  factory _$SparkARUserCopyWith(
          _SparkARUser value, $Res Function(_SparkARUser) then) =
      __$SparkARUserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id, String name, String iconUrl, List<SparkAREffect> effects});
}

/// @nodoc
class __$SparkARUserCopyWithImpl<$Res> extends _$SparkARUserCopyWithImpl<$Res>
    implements _$SparkARUserCopyWith<$Res> {
  __$SparkARUserCopyWithImpl(
      _SparkARUser _value, $Res Function(_SparkARUser) _then)
      : super(_value, (v) => _then(v as _SparkARUser));

  @override
  _SparkARUser get _value => super._value as _SparkARUser;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object iconUrl = freezed,
    Object effects = freezed,
  }) {
    return _then(_SparkARUser(
      id == freezed ? _value.id : id as String,
      name == freezed ? _value.name : name as String,
      iconUrl == freezed ? _value.iconUrl : iconUrl as String,
      effects == freezed ? _value.effects : effects as List<SparkAREffect>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_SparkARUser implements _SparkARUser {
  _$_SparkARUser(this.id, this.name, this.iconUrl, this.effects)
      : assert(id != null),
        assert(name != null),
        assert(iconUrl != null),
        assert(effects != null);

  factory _$_SparkARUser.fromJson(Map<String, dynamic> json) =>
      _$_$_SparkARUserFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String iconUrl;
  @override
  final List<SparkAREffect> effects;

  @override
  String toString() {
    return 'SparkARUser(id: $id, name: $name, iconUrl: $iconUrl, effects: $effects)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SparkARUser &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.iconUrl, iconUrl) ||
                const DeepCollectionEquality()
                    .equals(other.iconUrl, iconUrl)) &&
            (identical(other.effects, effects) ||
                const DeepCollectionEquality().equals(other.effects, effects)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(iconUrl) ^
      const DeepCollectionEquality().hash(effects);

  @JsonKey(ignore: true)
  @override
  _$SparkARUserCopyWith<_SparkARUser> get copyWith =>
      __$SparkARUserCopyWithImpl<_SparkARUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SparkARUserToJson(this);
  }
}

abstract class _SparkARUser implements SparkARUser {
  factory _SparkARUser(
          String id, String name, String iconUrl, List<SparkAREffect> effects) =
      _$_SparkARUser;

  factory _SparkARUser.fromJson(Map<String, dynamic> json) =
      _$_SparkARUser.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get iconUrl;
  @override
  List<SparkAREffect> get effects;
  @override
  @JsonKey(ignore: true)
  _$SparkARUserCopyWith<_SparkARUser> get copyWith;
}
