// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_keys_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PublicKeysResponse _$PublicKeysResponseFromJson(Map<String, dynamic> json) {
  return PublicKeysResponse(
    GeneratedKeyField.fromJson(json['generatedKey'] as Map<String, dynamic>),
    json['lsd'] as String,
    Map<String, int>.from(json['seal'] as Map),
    Map<String, int>.from(json['raw'] as Map),
    EncryptionField.fromJson(json['encryption'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PublicKeysResponseToJson(PublicKeysResponse instance) =>
    <String, dynamic>{
      'generatedKey': instance.generatedKey,
      'lsd': instance.lsd,
      'seal': instance.seal,
      'raw': instance.raw,
      'encryption': instance.encryption,
    };

EncryptionField _$EncryptionFieldFromJson(Map<String, dynamic> json) {
  return EncryptionField(
    json['publickey'] as String,
    json['keyId'] as String,
  );
}

Map<String, dynamic> _$EncryptionFieldToJson(EncryptionField instance) =>
    <String, dynamic>{
      'publickey': instance.publicKey,
      'keyId': instance.keyId,
    };

GeneratedKeyField _$GeneratedKeyFieldFromJson(Map<String, dynamic> json) {
  return GeneratedKeyField(
    AlgorithmField.fromJson(json['algorithm'] as Map<String, dynamic>),
    json['type'] as String,
    json['extractable'] as bool,
    (json['usages'] as List<dynamic>).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$GeneratedKeyFieldToJson(GeneratedKeyField instance) =>
    <String, dynamic>{
      'algorithm': instance.algorithm,
      'type': instance.type,
      'extractable': instance.extractable,
      'usages': instance.usages,
    };

AlgorithmField _$AlgorithmFieldFromJson(Map<String, dynamic> json) {
  return AlgorithmField(
    json['name'] as String,
    json['length'] as int,
  );
}

Map<String, dynamic> _$AlgorithmFieldToJson(AlgorithmField instance) =>
    <String, dynamic>{
      'name': instance.name,
      'length': instance.length,
    };
