// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sparkar_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SparkARUser _$SparkARUserFromJson(Map<String, dynamic> json) {
  return SparkARUser(
    json['name'] as String,
    (json['effects'] as List)
        ?.map((e) => e == null
            ? null
            : SparkAREffect.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SparkARUserToJson(SparkARUser instance) =>
    <String, dynamic>{
      'name': instance.name,
      'effects': instance.effects,
    };
