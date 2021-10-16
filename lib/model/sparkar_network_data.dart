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
}
