import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uqido_sparkar/model/sparkar_effect.dart';

part 'sparkar_user.freezed.dart';

//part 'sparkar_user.g.dart';

@freezed
class SparkARUser with _$SparkARUser {
  factory SparkARUser(
          String id, String name, String iconUrl, List<String> effects) =
      _SparkARUser;

  factory SparkARUser.fromJson(Map<String, dynamic> json) {
    return _$_SparkARUser(
      json['id'] as String,
      json['name'] as String,
      json['iconUrl'] as String,
      (json['effects'] as List<dynamic>).map((e) => e['id'] as String).toList(),
    );
  }

  @override
  String toString() {
    return "SparkARUser($id,$name,[$effects])";
  }
}
