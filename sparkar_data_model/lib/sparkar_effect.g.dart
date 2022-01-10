// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sparkar_effect.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SparkAREffect _$$_SparkAREffectFromJson(Map<String, dynamic> json) =>
    _$_SparkAREffect(
      json['id'] as String,
      json['name'] as String,
      json['submissionStatus'] as String,
      json['visibilityStatus'] as String,
      json['isDeprecated'] as bool,
      json['testLink'] as String,
      json['publicLink'] as String,
      json['iconUrl'] as String,
      isPreferite: json['isPreferite'] as bool? ?? false,
    );

Map<String, dynamic> _$$_SparkAREffectToJson(_$_SparkAREffect instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'submissionStatus': instance.submissionStatus,
      'visibilityStatus': instance.visibilityStatus,
      'isDeprecated': instance.isDeprecated,
      'testLink': instance.testLink,
      'publicLink': instance.publicLink,
      'iconUrl': instance.iconUrl,
      'isPreferite': instance.isPreferite,
    };
