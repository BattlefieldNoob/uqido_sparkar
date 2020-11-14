import 'package:json_annotation/json_annotation.dart';

part 'sparkar_effect.g.dart';

@JsonSerializable()
class SparkAREffect {
  final String id;
  final String name;
  final String submissionStatus;
  final String visibilityStatus;
  final bool isDeprecated;
  final String testLink;
  final String publicLink;
  final String iconUrl;

  SparkAREffect(
      this.id,
      this.name,
      this.submissionStatus,
      this.visibilityStatus,
      this.isDeprecated,
      this.testLink,
      this.publicLink,
      this.iconUrl);

  factory SparkAREffect.fromJson(Map<String, dynamic> json) =>
      _$SparkAREffectFromJson(json);

  Map<String, dynamic> toJson() => _$SparkAREffectToJson(this);
}
