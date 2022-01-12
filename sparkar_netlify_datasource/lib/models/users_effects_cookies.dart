
import 'package:json_annotation/json_annotation.dart';
import 'package:sparkar_data_model/sparkar_effect.dart';
import 'package:sparkar_data_model/sparkar_user.dart';

part 'users_effects_cookies.g.dart';


@JsonSerializable()
class UsersEffectsCookies {
  final List<SparkARUser> users;
  final List<SparkAREffect> effects;
  final String cookie;

  UsersEffectsCookies(this.users, this.effects, this.cookie);

  factory UsersEffectsCookies.fromJson(
      Map<String, dynamic> json) => _$UsersEffectsCookiesFromJson(json);

  Map<String, dynamic> toJson() => _$UsersEffectsCookiesToJson(this);
}