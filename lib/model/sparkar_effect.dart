
import 'package:json_annotation/json_annotation.dart';

part 'sparkar_effect.g.dart';

@JsonSerializable()
class SparkAREffect{
  final String name;
  final String testLink;
  final String publicLink;
  final String iconUrl;

  SparkAREffect(this.name, this.testLink, this.publicLink, this.iconUrl);

  factory SparkAREffect.fromJson(Map<String, dynamic> json) => _$SparkAREffectFromJson(json);

  Map<String, dynamic> toJson() => _$SparkAREffectToJson(this);
}