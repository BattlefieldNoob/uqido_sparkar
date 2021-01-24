// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sparkar_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SparkARUser _$_$_SparkARUserFromJson(Map<String, dynamic> json) {
  return _$_SparkARUser(
    json['id'] as String,
    json['name'] as String,
    json['iconUrl'] as String,
    (json['effects'] as List)
        ?.map((e) => e == null
            ? null
            : SparkAREffect.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$_$_SparkARUserToJson(_$_SparkARUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'iconUrl': instance.iconUrl,
      'effects': instance.effects,
    };
