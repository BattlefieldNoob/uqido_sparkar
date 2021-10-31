import 'package:freezed_annotation/freezed_annotation.dart';

part 'cookie_response.g.dart';

@JsonSerializable()
class CookieResponse{
  final String cookie;

  const CookieResponse(this.cookie);

  factory CookieResponse.fromJson(
      Map<String, dynamic> json) => _$CookieResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CookieResponseToJson(this);

}