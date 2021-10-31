import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uqido_sparkar/model/sparkar_effect.dart';
import 'package:uqido_sparkar/model/sparkar_user.dart';

part 'sparkar_network_data.freezed.dart';

@freezed
class SparkARNetworkData with _$SparkARNetworkData {
  factory SparkARNetworkData(
          List<SparkARUser> users, List<SparkAREffect> effects) =
      _SparkARNetworkData;

  factory SparkARNetworkData.empty() {
    return SparkARNetworkData([], []);
  }

  @override
  String toString() {
    return "SparkARNetworkData($users,$effects)";
  }

  factory SparkARNetworkData.fromJson(Map<String, dynamic> json) {
    final jsonResult = json['usersAndEffects'] as List<dynamic>;

    final users = jsonResult
        .map((user) => SparkARUser(
            user.id,
            user.name,
            user.iconUrl,
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
}
