import 'sparkar_effect.dart';
import 'sparkar_user.dart';

class SparkARNetworkData {

  final List<SparkARUser> users;
  final List<SparkAREffect> effects;

  SparkARNetworkData(this.users, this.effects);

  factory SparkARNetworkData.empty() {
    return SparkARNetworkData([], []);
  }

  @override
  String toString() {
    return "SparkARNetworkData($users,$effects)";
  }

  factory SparkARNetworkData.fromJson(Map<String, dynamic> json) => _$$SparkARNetworkDataFromJson(json);

  factory SparkARNetworkData.fromJsonV2(Map<String, dynamic> json) => _$$SparkARNetworkDataFromJsonV2(json);

  Map<String, dynamic> toJson() => _$$SparkARNetworkDataToJson(this);

}

Map<String, dynamic> _$$SparkARNetworkDataToJson(SparkARNetworkData data) {
  final usersMap = data.users.map((e) => e.toJson()).toList();
  final effectMap = data.effects.map((e) => e.toJson()).toList();

  for (var currentUser in usersMap) {
    final userEffects=(currentUser["effects"] as List<String>).map((e) => effectMap.firstWhere((element) => element["id"]==e));
    currentUser.addAll({"effects":userEffects.toList()});
  }
  return {"usersAndEffects":usersMap};
}

SparkARNetworkData _$$SparkARNetworkDataFromJson(Map<String, dynamic> json) {
  final jsonResult = json['usersAndEffects'] as List<dynamic>;

  final users = jsonResult
      .map((user) => SparkARUser(
      user['id'],
      user['name'],
      user['iconUrl'],
      (user['effects'] as List<dynamic>)
          .map((e) => e['id'] as String)
          .toList()))
      .toList();

  //TODO remove after editing BE
  final effects = jsonResult
      .expand((user) => user['effects'] as List<dynamic>)
      .map((effect) => SparkAREffect.fromJson(effect))
      .toList();

  return SparkARNetworkData(users, effects);
}

SparkARNetworkData _$$SparkARNetworkDataFromJsonV2(Map<String, dynamic> json) {
  final users = json['users']
      .map((user) => SparkARUser.fromJson(user)).cast<SparkARUser>().toList();

  final effects = json['effects']
      .map((effect) => SparkAREffect.fromJson(effect))
      .cast<SparkAREffect>()
      .toList();

  return SparkARNetworkData(users, effects);
}