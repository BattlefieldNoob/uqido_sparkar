import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
      String iconUrl,
      {@Default(false) bool isPreferite}) = _SparkAREffect;

  factory SparkAREffect.fromJson(Map<String, dynamic> json) =>
      _$SparkAREffectFromJson(json);

  @override
  String toString() {
    return "SparkAREffect($id,$name)";
  }
}
