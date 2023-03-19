// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'effect.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Effect _$$_EffectFromJson(Map<String, dynamic> json) => _$_Effect(
      json['id'] as String,
      json['is_enabled'] as bool,
      json['name'] as String,
      json['thumbnail_uri'] as String,
      json['submission_status'] as String,
      json['visibility_status'] as String,
      json['arExportFile'] == null
          ? null
          : ARExportFile.fromJson(json['arExportFile'] as Map<String, dynamic>),
      json['created_at'] as int,
      json['last_modified_at'] as int,
      json['test_link'] as String,
      json['share_link'] as String,
    );

Map<String, dynamic> _$$_EffectToJson(_$_Effect instance) => <String, dynamic>{
      'id': instance.id,
      'is_enabled': instance.isEnabled,
      'name': instance.name,
      'thumbnail_uri': instance.thumbnailUri,
      'submission_status': instance.submissionStatus,
      'visibility_status': instance.visibilityStatus,
      'arExportFile': instance.arExportFile,
      'created_at': instance.createdAt,
      'last_modified_at': instance.lastModifiedAt,
      'test_link': instance.testLink,
      'share_link': instance.shareLink,
    };
