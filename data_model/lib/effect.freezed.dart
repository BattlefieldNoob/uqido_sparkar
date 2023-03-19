// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'effect.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Effect _$EffectFromJson(Map<String, dynamic> json) {
  return _Effect.fromJson(json);
}

/// @nodoc
mixin _$Effect {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "is_enabled")
  bool get isEnabled => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "thumbnail_uri")
  String get thumbnailUri => throw _privateConstructorUsedError;
  @JsonKey(name: "submission_status")
  String get submissionStatus => throw _privateConstructorUsedError;
  @JsonKey(name: "visibility_status")
  String get visibilityStatus => throw _privateConstructorUsedError;
  ARExportFile? get arExportFile => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  int get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "last_modified_at")
  int get lastModifiedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "test_link")
  String get testLink => throw _privateConstructorUsedError;
  @JsonKey(name: "share_link")
  String get shareLink => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EffectCopyWith<Effect> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EffectCopyWith<$Res> {
  factory $EffectCopyWith(Effect value, $Res Function(Effect) then) =
      _$EffectCopyWithImpl<$Res, Effect>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: "is_enabled") bool isEnabled,
      String name,
      @JsonKey(name: "thumbnail_uri") String thumbnailUri,
      @JsonKey(name: "submission_status") String submissionStatus,
      @JsonKey(name: "visibility_status") String visibilityStatus,
      ARExportFile? arExportFile,
      @JsonKey(name: "created_at") int createdAt,
      @JsonKey(name: "last_modified_at") int lastModifiedAt,
      @JsonKey(name: "test_link") String testLink,
      @JsonKey(name: "share_link") String shareLink});

  $ARExportFileCopyWith<$Res>? get arExportFile;
}

/// @nodoc
class _$EffectCopyWithImpl<$Res, $Val extends Effect>
    implements $EffectCopyWith<$Res> {
  _$EffectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isEnabled = null,
    Object? name = null,
    Object? thumbnailUri = null,
    Object? submissionStatus = null,
    Object? visibilityStatus = null,
    Object? arExportFile = freezed,
    Object? createdAt = null,
    Object? lastModifiedAt = null,
    Object? testLink = null,
    Object? shareLink = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isEnabled: null == isEnabled
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUri: null == thumbnailUri
          ? _value.thumbnailUri
          : thumbnailUri // ignore: cast_nullable_to_non_nullable
              as String,
      submissionStatus: null == submissionStatus
          ? _value.submissionStatus
          : submissionStatus // ignore: cast_nullable_to_non_nullable
              as String,
      visibilityStatus: null == visibilityStatus
          ? _value.visibilityStatus
          : visibilityStatus // ignore: cast_nullable_to_non_nullable
              as String,
      arExportFile: freezed == arExportFile
          ? _value.arExportFile
          : arExportFile // ignore: cast_nullable_to_non_nullable
              as ARExportFile?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      lastModifiedAt: null == lastModifiedAt
          ? _value.lastModifiedAt
          : lastModifiedAt // ignore: cast_nullable_to_non_nullable
              as int,
      testLink: null == testLink
          ? _value.testLink
          : testLink // ignore: cast_nullable_to_non_nullable
              as String,
      shareLink: null == shareLink
          ? _value.shareLink
          : shareLink // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ARExportFileCopyWith<$Res>? get arExportFile {
    if (_value.arExportFile == null) {
      return null;
    }

    return $ARExportFileCopyWith<$Res>(_value.arExportFile!, (value) {
      return _then(_value.copyWith(arExportFile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_EffectCopyWith<$Res> implements $EffectCopyWith<$Res> {
  factory _$$_EffectCopyWith(_$_Effect value, $Res Function(_$_Effect) then) =
      __$$_EffectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: "is_enabled") bool isEnabled,
      String name,
      @JsonKey(name: "thumbnail_uri") String thumbnailUri,
      @JsonKey(name: "submission_status") String submissionStatus,
      @JsonKey(name: "visibility_status") String visibilityStatus,
      ARExportFile? arExportFile,
      @JsonKey(name: "created_at") int createdAt,
      @JsonKey(name: "last_modified_at") int lastModifiedAt,
      @JsonKey(name: "test_link") String testLink,
      @JsonKey(name: "share_link") String shareLink});

  @override
  $ARExportFileCopyWith<$Res>? get arExportFile;
}

/// @nodoc
class __$$_EffectCopyWithImpl<$Res>
    extends _$EffectCopyWithImpl<$Res, _$_Effect>
    implements _$$_EffectCopyWith<$Res> {
  __$$_EffectCopyWithImpl(_$_Effect _value, $Res Function(_$_Effect) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isEnabled = null,
    Object? name = null,
    Object? thumbnailUri = null,
    Object? submissionStatus = null,
    Object? visibilityStatus = null,
    Object? arExportFile = freezed,
    Object? createdAt = null,
    Object? lastModifiedAt = null,
    Object? testLink = null,
    Object? shareLink = null,
  }) {
    return _then(_$_Effect(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == isEnabled
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      null == thumbnailUri
          ? _value.thumbnailUri
          : thumbnailUri // ignore: cast_nullable_to_non_nullable
              as String,
      null == submissionStatus
          ? _value.submissionStatus
          : submissionStatus // ignore: cast_nullable_to_non_nullable
              as String,
      null == visibilityStatus
          ? _value.visibilityStatus
          : visibilityStatus // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == arExportFile
          ? _value.arExportFile
          : arExportFile // ignore: cast_nullable_to_non_nullable
              as ARExportFile?,
      null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      null == lastModifiedAt
          ? _value.lastModifiedAt
          : lastModifiedAt // ignore: cast_nullable_to_non_nullable
              as int,
      null == testLink
          ? _value.testLink
          : testLink // ignore: cast_nullable_to_non_nullable
              as String,
      null == shareLink
          ? _value.shareLink
          : shareLink // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Effect implements _Effect {
  _$_Effect(
      this.id,
      @JsonKey(name: "is_enabled") this.isEnabled,
      this.name,
      @JsonKey(name: "thumbnail_uri") this.thumbnailUri,
      @JsonKey(name: "submission_status") this.submissionStatus,
      @JsonKey(name: "visibility_status") this.visibilityStatus,
      this.arExportFile,
      @JsonKey(name: "created_at") this.createdAt,
      @JsonKey(name: "last_modified_at") this.lastModifiedAt,
      @JsonKey(name: "test_link") this.testLink,
      @JsonKey(name: "share_link") this.shareLink);

  factory _$_Effect.fromJson(Map<String, dynamic> json) =>
      _$$_EffectFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: "is_enabled")
  final bool isEnabled;
  @override
  final String name;
  @override
  @JsonKey(name: "thumbnail_uri")
  final String thumbnailUri;
  @override
  @JsonKey(name: "submission_status")
  final String submissionStatus;
  @override
  @JsonKey(name: "visibility_status")
  final String visibilityStatus;
  @override
  final ARExportFile? arExportFile;
  @override
  @JsonKey(name: "created_at")
  final int createdAt;
  @override
  @JsonKey(name: "last_modified_at")
  final int lastModifiedAt;
  @override
  @JsonKey(name: "test_link")
  final String testLink;
  @override
  @JsonKey(name: "share_link")
  final String shareLink;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Effect &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isEnabled, isEnabled) ||
                other.isEnabled == isEnabled) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.thumbnailUri, thumbnailUri) ||
                other.thumbnailUri == thumbnailUri) &&
            (identical(other.submissionStatus, submissionStatus) ||
                other.submissionStatus == submissionStatus) &&
            (identical(other.visibilityStatus, visibilityStatus) ||
                other.visibilityStatus == visibilityStatus) &&
            (identical(other.arExportFile, arExportFile) ||
                other.arExportFile == arExportFile) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.lastModifiedAt, lastModifiedAt) ||
                other.lastModifiedAt == lastModifiedAt) &&
            (identical(other.testLink, testLink) ||
                other.testLink == testLink) &&
            (identical(other.shareLink, shareLink) ||
                other.shareLink == shareLink));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      isEnabled,
      name,
      thumbnailUri,
      submissionStatus,
      visibilityStatus,
      arExportFile,
      createdAt,
      lastModifiedAt,
      testLink,
      shareLink);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EffectCopyWith<_$_Effect> get copyWith =>
      __$$_EffectCopyWithImpl<_$_Effect>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EffectToJson(
      this,
    );
  }
}

abstract class _Effect implements Effect {
  factory _Effect(
      final String id,
      @JsonKey(name: "is_enabled") final bool isEnabled,
      final String name,
      @JsonKey(name: "thumbnail_uri") final String thumbnailUri,
      @JsonKey(name: "submission_status") final String submissionStatus,
      @JsonKey(name: "visibility_status") final String visibilityStatus,
      final ARExportFile? arExportFile,
      @JsonKey(name: "created_at") final int createdAt,
      @JsonKey(name: "last_modified_at") final int lastModifiedAt,
      @JsonKey(name: "test_link") final String testLink,
      @JsonKey(name: "share_link") final String shareLink) = _$_Effect;

  factory _Effect.fromJson(Map<String, dynamic> json) = _$_Effect.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: "is_enabled")
  bool get isEnabled;
  @override
  String get name;
  @override
  @JsonKey(name: "thumbnail_uri")
  String get thumbnailUri;
  @override
  @JsonKey(name: "submission_status")
  String get submissionStatus;
  @override
  @JsonKey(name: "visibility_status")
  String get visibilityStatus;
  @override
  ARExportFile? get arExportFile;
  @override
  @JsonKey(name: "created_at")
  int get createdAt;
  @override
  @JsonKey(name: "last_modified_at")
  int get lastModifiedAt;
  @override
  @JsonKey(name: "test_link")
  String get testLink;
  @override
  @JsonKey(name: "share_link")
  String get shareLink;
  @override
  @JsonKey(ignore: true)
  _$$_EffectCopyWith<_$_Effect> get copyWith =>
      throw _privateConstructorUsedError;
}
