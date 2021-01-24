// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'sparkar_effect.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
SparkAREffect _$SparkAREffectFromJson(Map<String, dynamic> json) {
  return _SparkAREffect.fromJson(json);
}

/// @nodoc
class _$SparkAREffectTearOff {
  const _$SparkAREffectTearOff();

// ignore: unused_element
  _SparkAREffect call(
      String id,
      String name,
      String submissionStatus,
      String visibilityStatus,
      bool isDeprecated,
      String testLink,
      String publicLink,
      String iconUrl) {
    return _SparkAREffect(
      id,
      name,
      submissionStatus,
      visibilityStatus,
      isDeprecated,
      testLink,
      publicLink,
      iconUrl,
    );
  }

// ignore: unused_element
  SparkAREffect fromJson(Map<String, Object> json) {
    return SparkAREffect.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $SparkAREffect = _$SparkAREffectTearOff();

/// @nodoc
mixin _$SparkAREffect {
  String get id;
  String get name;
  String get submissionStatus;
  String get visibilityStatus;
  bool get isDeprecated;
  String get testLink;
  String get publicLink;
  String get iconUrl;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $SparkAREffectCopyWith<SparkAREffect> get copyWith;
}

/// @nodoc
abstract class $SparkAREffectCopyWith<$Res> {
  factory $SparkAREffectCopyWith(
          SparkAREffect value, $Res Function(SparkAREffect) then) =
      _$SparkAREffectCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      String submissionStatus,
      String visibilityStatus,
      bool isDeprecated,
      String testLink,
      String publicLink,
      String iconUrl});
}

/// @nodoc
class _$SparkAREffectCopyWithImpl<$Res>
    implements $SparkAREffectCopyWith<$Res> {
  _$SparkAREffectCopyWithImpl(this._value, this._then);

  final SparkAREffect _value;
  // ignore: unused_field
  final $Res Function(SparkAREffect) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object submissionStatus = freezed,
    Object visibilityStatus = freezed,
    Object isDeprecated = freezed,
    Object testLink = freezed,
    Object publicLink = freezed,
    Object iconUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      submissionStatus: submissionStatus == freezed
          ? _value.submissionStatus
          : submissionStatus as String,
      visibilityStatus: visibilityStatus == freezed
          ? _value.visibilityStatus
          : visibilityStatus as String,
      isDeprecated:
          isDeprecated == freezed ? _value.isDeprecated : isDeprecated as bool,
      testLink: testLink == freezed ? _value.testLink : testLink as String,
      publicLink:
          publicLink == freezed ? _value.publicLink : publicLink as String,
      iconUrl: iconUrl == freezed ? _value.iconUrl : iconUrl as String,
    ));
  }
}

/// @nodoc
abstract class _$SparkAREffectCopyWith<$Res>
    implements $SparkAREffectCopyWith<$Res> {
  factory _$SparkAREffectCopyWith(
          _SparkAREffect value, $Res Function(_SparkAREffect) then) =
      __$SparkAREffectCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      String submissionStatus,
      String visibilityStatus,
      bool isDeprecated,
      String testLink,
      String publicLink,
      String iconUrl});
}

/// @nodoc
class __$SparkAREffectCopyWithImpl<$Res>
    extends _$SparkAREffectCopyWithImpl<$Res>
    implements _$SparkAREffectCopyWith<$Res> {
  __$SparkAREffectCopyWithImpl(
      _SparkAREffect _value, $Res Function(_SparkAREffect) _then)
      : super(_value, (v) => _then(v as _SparkAREffect));

  @override
  _SparkAREffect get _value => super._value as _SparkAREffect;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object submissionStatus = freezed,
    Object visibilityStatus = freezed,
    Object isDeprecated = freezed,
    Object testLink = freezed,
    Object publicLink = freezed,
    Object iconUrl = freezed,
  }) {
    return _then(_SparkAREffect(
      id == freezed ? _value.id : id as String,
      name == freezed ? _value.name : name as String,
      submissionStatus == freezed
          ? _value.submissionStatus
          : submissionStatus as String,
      visibilityStatus == freezed
          ? _value.visibilityStatus
          : visibilityStatus as String,
      isDeprecated == freezed ? _value.isDeprecated : isDeprecated as bool,
      testLink == freezed ? _value.testLink : testLink as String,
      publicLink == freezed ? _value.publicLink : publicLink as String,
      iconUrl == freezed ? _value.iconUrl : iconUrl as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_SparkAREffect implements _SparkAREffect {
  _$_SparkAREffect(
      this.id,
      this.name,
      this.submissionStatus,
      this.visibilityStatus,
      this.isDeprecated,
      this.testLink,
      this.publicLink,
      this.iconUrl)
      : assert(id != null),
        assert(name != null),
        assert(submissionStatus != null),
        assert(visibilityStatus != null),
        assert(isDeprecated != null),
        assert(testLink != null),
        assert(publicLink != null),
        assert(iconUrl != null);

  factory _$_SparkAREffect.fromJson(Map<String, dynamic> json) =>
      _$_$_SparkAREffectFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String submissionStatus;
  @override
  final String visibilityStatus;
  @override
  final bool isDeprecated;
  @override
  final String testLink;
  @override
  final String publicLink;
  @override
  final String iconUrl;

  @override
  String toString() {
    return 'SparkAREffect(id: $id, name: $name, submissionStatus: $submissionStatus, visibilityStatus: $visibilityStatus, isDeprecated: $isDeprecated, testLink: $testLink, publicLink: $publicLink, iconUrl: $iconUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SparkAREffect &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.submissionStatus, submissionStatus) ||
                const DeepCollectionEquality()
                    .equals(other.submissionStatus, submissionStatus)) &&
            (identical(other.visibilityStatus, visibilityStatus) ||
                const DeepCollectionEquality()
                    .equals(other.visibilityStatus, visibilityStatus)) &&
            (identical(other.isDeprecated, isDeprecated) ||
                const DeepCollectionEquality()
                    .equals(other.isDeprecated, isDeprecated)) &&
            (identical(other.testLink, testLink) ||
                const DeepCollectionEquality()
                    .equals(other.testLink, testLink)) &&
            (identical(other.publicLink, publicLink) ||
                const DeepCollectionEquality()
                    .equals(other.publicLink, publicLink)) &&
            (identical(other.iconUrl, iconUrl) ||
                const DeepCollectionEquality().equals(other.iconUrl, iconUrl)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(submissionStatus) ^
      const DeepCollectionEquality().hash(visibilityStatus) ^
      const DeepCollectionEquality().hash(isDeprecated) ^
      const DeepCollectionEquality().hash(testLink) ^
      const DeepCollectionEquality().hash(publicLink) ^
      const DeepCollectionEquality().hash(iconUrl);

  @JsonKey(ignore: true)
  @override
  _$SparkAREffectCopyWith<_SparkAREffect> get copyWith =>
      __$SparkAREffectCopyWithImpl<_SparkAREffect>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SparkAREffectToJson(this);
  }
}

abstract class _SparkAREffect implements SparkAREffect {
  factory _SparkAREffect(
      String id,
      String name,
      String submissionStatus,
      String visibilityStatus,
      bool isDeprecated,
      String testLink,
      String publicLink,
      String iconUrl) = _$_SparkAREffect;

  factory _SparkAREffect.fromJson(Map<String, dynamic> json) =
      _$_SparkAREffect.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get submissionStatus;
  @override
  String get visibilityStatus;
  @override
  bool get isDeprecated;
  @override
  String get testLink;
  @override
  String get publicLink;
  @override
  String get iconUrl;
  @override
  @JsonKey(ignore: true)
  _$SparkAREffectCopyWith<_SparkAREffect> get copyWith;
}
