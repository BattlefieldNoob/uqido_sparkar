import 'package:json_annotation/json_annotation.dart';

part 'public_keys_response.g.dart';

@JsonSerializable()
class PublicKeysResponse {
  final GeneratedKeyField generatedKey;

  final String lsd;

  final Map<String, int> seal;
  final Map<String, int> raw;

  final EncryptionField encryption;

  const PublicKeysResponse(
      this.generatedKey, this.lsd, this.seal, this.raw, this.encryption);

  factory PublicKeysResponse.fromJson(Map<String, dynamic> json) =>
      _$PublicKeysResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PublicKeysResponseToJson(this);
}

@JsonSerializable()
class EncryptionField {

  @JsonKey(name: "publickey")
  final String publicKey;
  final String keyId;

  EncryptionField(this.publicKey, this.keyId);

  factory EncryptionField.fromJson(Map<String, dynamic> json) =>
      _$EncryptionFieldFromJson(json);

  Map<String, dynamic> toJson() => _$EncryptionFieldToJson(this);
}

@JsonSerializable()
class GeneratedKeyField {

  final AlgorithmField algorithm;
  final String type;
  final bool extractable;
  final List<String> usages;

  GeneratedKeyField(this.algorithm, this.type, this.extractable, this.usages);

  factory GeneratedKeyField.fromJson(Map<String, dynamic> json) =>
      _$GeneratedKeyFieldFromJson(json);

  Map<String, dynamic> toJson() => _$GeneratedKeyFieldToJson(this);
}

@JsonSerializable()
class AlgorithmField {

  final String name;
  final int length;

  AlgorithmField(this.name, this.length);

  factory AlgorithmField.fromJson(Map<String, dynamic> json) =>
      _$AlgorithmFieldFromJson(json);

  Map<String, dynamic> toJson() => _$AlgorithmFieldToJson(this);
}
