import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:data_model/effect.dart';
import 'package:data_model/picture.dart';

part 'owner.freezed.dart';
part 'owner.g.dart';

@freezed
class Owner with _$Owner {
  factory Owner(
    String id,
    @JsonKey(name: "owner_type") String ownerType,
    @JsonKey(name: "display_name") String displayName,
    @JsonKey(name: "profile_picture") Picture profilePicture,
    String username,
    List<Effect> effects,
  ) = _Owner;

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);

  @override
  String toString() {
    return "SparkARUser($id,$displayName,[$effects])";
  }
}
