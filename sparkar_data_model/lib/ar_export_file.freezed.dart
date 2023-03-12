// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ar_export_file.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ARExportFile _$ARExportFileFromJson(Map<String, dynamic> json) {
  return _ARExportFile.fromJson(json);
}

/// @nodoc
mixin _$ARExportFile {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "is_deprecated")
  bool get isDeprecated => throw _privateConstructorUsedError;
  @JsonKey(name: "to_be_deprecated")
  bool get toBeDeprecated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ARExportFileCopyWith<ARExportFile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ARExportFileCopyWith<$Res> {
  factory $ARExportFileCopyWith(
          ARExportFile value, $Res Function(ARExportFile) then) =
      _$ARExportFileCopyWithImpl<$Res, ARExportFile>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: "is_deprecated") bool isDeprecated,
      @JsonKey(name: "to_be_deprecated") bool toBeDeprecated});
}

/// @nodoc
class _$ARExportFileCopyWithImpl<$Res, $Val extends ARExportFile>
    implements $ARExportFileCopyWith<$Res> {
  _$ARExportFileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isDeprecated = null,
    Object? toBeDeprecated = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isDeprecated: null == isDeprecated
          ? _value.isDeprecated
          : isDeprecated // ignore: cast_nullable_to_non_nullable
              as bool,
      toBeDeprecated: null == toBeDeprecated
          ? _value.toBeDeprecated
          : toBeDeprecated // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ARExportFileCopyWith<$Res>
    implements $ARExportFileCopyWith<$Res> {
  factory _$$_ARExportFileCopyWith(
          _$_ARExportFile value, $Res Function(_$_ARExportFile) then) =
      __$$_ARExportFileCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: "is_deprecated") bool isDeprecated,
      @JsonKey(name: "to_be_deprecated") bool toBeDeprecated});
}

/// @nodoc
class __$$_ARExportFileCopyWithImpl<$Res>
    extends _$ARExportFileCopyWithImpl<$Res, _$_ARExportFile>
    implements _$$_ARExportFileCopyWith<$Res> {
  __$$_ARExportFileCopyWithImpl(
      _$_ARExportFile _value, $Res Function(_$_ARExportFile) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isDeprecated = null,
    Object? toBeDeprecated = null,
  }) {
    return _then(_$_ARExportFile(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == isDeprecated
          ? _value.isDeprecated
          : isDeprecated // ignore: cast_nullable_to_non_nullable
              as bool,
      null == toBeDeprecated
          ? _value.toBeDeprecated
          : toBeDeprecated // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ARExportFile implements _ARExportFile {
  _$_ARExportFile(this.id, @JsonKey(name: "is_deprecated") this.isDeprecated,
      @JsonKey(name: "to_be_deprecated") this.toBeDeprecated);

  factory _$_ARExportFile.fromJson(Map<String, dynamic> json) =>
      _$$_ARExportFileFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: "is_deprecated")
  final bool isDeprecated;
  @override
  @JsonKey(name: "to_be_deprecated")
  final bool toBeDeprecated;

  @override
  String toString() {
    return 'ARExportFile(id: $id, isDeprecated: $isDeprecated, toBeDeprecated: $toBeDeprecated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ARExportFile &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isDeprecated, isDeprecated) ||
                other.isDeprecated == isDeprecated) &&
            (identical(other.toBeDeprecated, toBeDeprecated) ||
                other.toBeDeprecated == toBeDeprecated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, isDeprecated, toBeDeprecated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ARExportFileCopyWith<_$_ARExportFile> get copyWith =>
      __$$_ARExportFileCopyWithImpl<_$_ARExportFile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ARExportFileToJson(
      this,
    );
  }
}

abstract class _ARExportFile implements ARExportFile {
  factory _ARExportFile(
          final String id,
          @JsonKey(name: "is_deprecated") final bool isDeprecated,
          @JsonKey(name: "to_be_deprecated") final bool toBeDeprecated) =
      _$_ARExportFile;

  factory _ARExportFile.fromJson(Map<String, dynamic> json) =
      _$_ARExportFile.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: "is_deprecated")
  bool get isDeprecated;
  @override
  @JsonKey(name: "to_be_deprecated")
  bool get toBeDeprecated;
  @override
  @JsonKey(ignore: true)
  _$$_ARExportFileCopyWith<_$_ARExportFile> get copyWith =>
      throw _privateConstructorUsedError;
}
