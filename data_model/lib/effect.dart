import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:data_model/ar_export_file.dart';

part 'effect.freezed.dart';
part 'effect.g.dart';

@freezed
class Effect with _$Effect {
  factory Effect(
      String id,
      @JsonKey(name: "is_enabled") bool isEnabled,
      String name,
      @JsonKey(name: "thumbnail_uri") String thumbnailUri,
      @JsonKey(name: "submission_status") String submissionStatus,
      @JsonKey(name: "visibility_status") String visibilityStatus,
      ARExportFile? arExportFile,
      @JsonKey(name: "created_at") int createdAt,
      @JsonKey(name: "last_modified_at") int lastModifiedAt,
      @JsonKey(name: "test_link") String testLink,
      @JsonKey(name: "share_link") String shareLink) = _Effect;

  factory Effect.fromJson(Map<String, dynamic> json) => _$EffectFromJson(json);

  @override
  String toString() {
    return "SparkAREffect($id,$name)";
  }
}
