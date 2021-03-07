import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sparkar_effect.freezed.dart';
part 'sparkar_effect.g.dart';

@freezed
class SparkAREffect with _$SparkAREffect {
  factory SparkAREffect(
      String id,
      String name,
      String submissionStatus,
      String visibilityStatus,
      bool isDeprecated,
      String testLink,
      String publicLink,
      String iconUrl) = _SparkAREffect;

  factory SparkAREffect.fromJson(Map<String, dynamic> json) =>
      _$SparkAREffectFromJson(json);
}
