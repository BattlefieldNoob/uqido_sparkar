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
    (json['effects'] as List<dynamic>).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$_$_SparkARUserToJson(_$_SparkARUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'iconUrl': instance.iconUrl,
      'effects': instance.effects,
    };
