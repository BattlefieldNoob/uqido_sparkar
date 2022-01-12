// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_effects_cookies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersEffectsCookies _$UsersEffectsCookiesFromJson(Map<String, dynamic> json) =>
    UsersEffectsCookies(
      (json['users'] as List<dynamic>)
          .map((e) => SparkARUser.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['effects'] as List<dynamic>)
          .map((e) => SparkAREffect.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['cookie'] as String,
    );

Map<String, dynamic> _$UsersEffectsCookiesToJson(
        UsersEffectsCookies instance) =>
    <String, dynamic>{
      'users': instance.users,
      'effects': instance.effects,
      'cookie': instance.cookie,
    };
