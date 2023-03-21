// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'owner.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Owner _$OwnerFromJson(Map<String, dynamic> json) {
  return _Owner.fromJson(json);
}

/// @nodoc
mixin _$Owner {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "owner_type")
  String get ownerType => throw _privateConstructorUsedError;
  @JsonKey(name: "display_name")
  String get displayName => throw _privateConstructorUsedError;
  @JsonKey(name: "profile_picture")
  Picture get profilePicture => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  List<Effect> get effects => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OwnerCopyWith<Owner> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OwnerCopyWith<$Res> {
  factory $OwnerCopyWith(Owner value, $Res Function(Owner) then) =
      _$OwnerCopyWithImpl<$Res, Owner>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: "owner_type") String ownerType,
      @JsonKey(name: "display_name") String displayName,
      @JsonKey(name: "profile_picture") Picture profilePicture,
      String username,
      List<Effect> effects});

  $PictureCopyWith<$Res> get profilePicture;
}

/// @nodoc
class _$OwnerCopyWithImpl<$Res, $Val extends Owner>
    implements $OwnerCopyWith<$Res> {
  _$OwnerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ownerType = null,
    Object? displayName = null,
    Object? profilePicture = null,
    Object? username = null,
    Object? effects = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ownerType: null == ownerType
          ? _value.ownerType
          : ownerType // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      profilePicture: null == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as Picture,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      effects: null == effects
          ? _value.effects
          : effects // ignore: cast_nullable_to_non_nullable
              as List<Effect>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PictureCopyWith<$Res> get profilePicture {
    return $PictureCopyWith<$Res>(_value.profilePicture, (value) {
      return _then(_value.copyWith(profilePicture: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OwnerCopyWith<$Res> implements $OwnerCopyWith<$Res> {
  factory _$$_OwnerCopyWith(_$_Owner value, $Res Function(_$_Owner) then) =
      __$$_OwnerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: "owner_type") String ownerType,
      @JsonKey(name: "display_name") String displayName,
      @JsonKey(name: "profile_picture") Picture profilePicture,
      String username,
      List<Effect> effects});

  @override
  $PictureCopyWith<$Res> get profilePicture;
}

/// @nodoc
class __$$_OwnerCopyWithImpl<$Res> extends _$OwnerCopyWithImpl<$Res, _$_Owner>
    implements _$$_OwnerCopyWith<$Res> {
  __$$_OwnerCopyWithImpl(_$_Owner _value, $Res Function(_$_Owner) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ownerType = null,
    Object? displayName = null,
    Object? profilePicture = null,
    Object? username = null,
    Object? effects = null,
  }) {
    return _then(_$_Owner(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == ownerType
          ? _value.ownerType
          : ownerType // ignore: cast_nullable_to_non_nullable
              as String,
      null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      null == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as Picture,
      null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      null == effects
          ? _value._effects
          : effects // ignore: cast_nullable_to_non_nullable
              as List<Effect>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Owner implements _Owner {
  _$_Owner(
      this.id,
      @JsonKey(name: "owner_type") this.ownerType,
      @JsonKey(name: "display_name") this.displayName,
      @JsonKey(name: "profile_picture") this.profilePicture,
      this.username,
      final List<Effect> effects)
      : _effects = effects;

  factory _$_Owner.fromJson(Map<String, dynamic> json) =>
      _$$_OwnerFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: "owner_type")
  final String ownerType;
  @override
  @JsonKey(name: "display_name")
  final String displayName;
  @override
  @JsonKey(name: "profile_picture")
  final Picture profilePicture;
  @override
  final String username;
  final List<Effect> _effects;
  @override
  List<Effect> get effects {
    if (_effects is EqualUnmodifiableListView) return _effects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_effects);
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Owner &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ownerType, ownerType) ||
                other.ownerType == ownerType) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture) &&
            (identical(other.username, username) ||
                other.username == username) &&
            const DeepCollectionEquality().equals(other._effects, _effects));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, ownerType, displayName,
      profilePicture, username, const DeepCollectionEquality().hash(_effects));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OwnerCopyWith<_$_Owner> get copyWith =>
      __$$_OwnerCopyWithImpl<_$_Owner>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OwnerToJson(
      this,
    );
  }
}

abstract class _Owner implements Owner {
  factory _Owner(
      final String id,
      @JsonKey(name: "owner_type") final String ownerType,
      @JsonKey(name: "display_name") final String displayName,
      @JsonKey(name: "profile_picture") final Picture profilePicture,
      final String username,
      final List<Effect> effects) = _$_Owner;

  factory _Owner.fromJson(Map<String, dynamic> json) = _$_Owner.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: "owner_type")
  String get ownerType;
  @override
  @JsonKey(name: "display_name")
  String get displayName;
  @override
  @JsonKey(name: "profile_picture")
  Picture get profilePicture;
  @override
  String get username;
  @override
  List<Effect> get effects;
  @override
  @JsonKey(ignore: true)
  _$$_OwnerCopyWith<_$_Owner> get copyWith =>
      throw _privateConstructorUsedError;
}
