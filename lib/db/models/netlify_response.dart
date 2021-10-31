import 'package:freezed_annotation/freezed_annotation.dart';

part 'netlify_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class NetlifyResponse<T> {
  final T? data;

  const NetlifyResponse(this.data);

  factory NetlifyResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$NetlifyResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(T Function(Object? json) toJsonT) =>
      _$NetlifyResponseToJson(this, toJsonT);
}
