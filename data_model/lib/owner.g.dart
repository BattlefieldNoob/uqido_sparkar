// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'owner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Owner _$$_OwnerFromJson(Map<String, dynamic> json) => _$_Owner(
      json['id'] as String,
      json['owner_type'] as String,
      json['display_name'] as String,
      Picture.fromJson(json['profile_picture'] as Map<String, dynamic>),
      json['username'] as String,
      (json['effects'] as List<dynamic>)
          .map((e) => Effect.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_OwnerToJson(_$_Owner instance) => <String, dynamic>{
      'id': instance.id,
      'owner_type': instance.ownerType,
      'display_name': instance.displayName,
      'profile_picture': instance.profilePicture,
      'username': instance.username,
      'effects': instance.effects,
    };
