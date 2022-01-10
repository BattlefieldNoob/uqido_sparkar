import 'package:freezed_annotation/freezed_annotation.dart';

part 'sparkar_user.freezed.dart';

part 'sparkar_user.g.dart';

@freezed
class SparkARUser with _$SparkARUser {

  const SparkARUser._(); // Added constructor

  factory SparkARUser(
          String id, String name, String iconUrl, List<String> effects) =
      _SparkARUser;

  factory SparkARUser.fromJson(Map<String, dynamic> json) => _$SparkARUserFromJson(json);

  @override
  String toString() {
    return "SparkARUser($id, $name, #effects:${effects.length})";
  }
}
