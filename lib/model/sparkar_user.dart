import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uqido_sparkar/model/sparkar_effect.dart';

part 'sparkar_user.freezed.dart';

part 'sparkar_user.g.dart';

@freezed
class SparkARUser with _$SparkARUser {
  factory SparkARUser(
      String id, String name, String iconUrl, List<String> effects) = _SparkARUser;

  factory SparkARUser.fromJson(Map<String, dynamic> json) =>
      _$SparkARUserFromJson(json);

  @override
  String toString() {
    return "SparkARUser($id,$name,[$effects])";
  }
}
