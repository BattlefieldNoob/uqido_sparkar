import 'package:json_annotation/json_annotation.dart';
import 'package:uqido_sparkar/model/sparkar_effect.dart';

part 'sparkar_user.g.dart';

@JsonSerializable()
class SparkARUser {
  final String id;
  final String name;
  final String iconUrl;
  final List<SparkAREffect> effects;

  SparkARUser._internal(this.id, this.name, this.iconUrl, this.effects);

  SparkARUser cloneWithEffects(List<SparkAREffect> effects) {
    return SparkARUser._internal(id, name, iconUrl, effects);
  }

  factory SparkARUser.fromJson(Map<String, dynamic> json) =>
      _$SparkARUserFromJson(json);

  Map<String, dynamic> toJson() => _$SparkARUserToJson(this);
}
