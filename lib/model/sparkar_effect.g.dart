// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sparkar_effect.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SparkAREffect _$SparkAREffectFromJson(Map<String, dynamic> json) {
  return SparkAREffect(
    json['id'] as String,
    json['name'] as String,
    json['submissionStatus'] as String,
    json['visibilityStatus'] as String,
    json['isDeprecated'] as bool,
    json['testLink'] as String,
    json['publicLink'] as String,
    json['iconUrl'] as String,
  );
}

Map<String, dynamic> _$SparkAREffectToJson(SparkAREffect instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'submissionStatus': instance.submissionStatus,
      'visibilityStatus': instance.visibilityStatus,
      'isDeprecated': instance.isDeprecated,
      'testLink': instance.testLink,
      'publicLink': instance.publicLink,
      'iconUrl': instance.iconUrl,
    };
