import 'package:freezed_annotation/freezed_annotation.dart';

part 'sparkar_effect.freezed.dart';

part 'sparkar_effect.g.dart';

@freezed
class SparkAREffect with _$SparkAREffect {

  const SparkAREffect._();

  factory SparkAREffect(
      String id,
      String name,
      String ownerId,
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
    return "SparkAREffect($id, $name, owner: $ownerId)";
  }
}
