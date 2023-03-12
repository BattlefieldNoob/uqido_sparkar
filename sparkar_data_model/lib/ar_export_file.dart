import 'package:freezed_annotation/freezed_annotation.dart';

part 'ar_export_file.freezed.dart';
part 'ar_export_file.g.dart';

@freezed
class ARExportFile with _$ARExportFile {
  factory ARExportFile(
      String id,
      @JsonKey(name: "is_deprecated") bool isDeprecated,
      @JsonKey(name: "to_be_deprecated") bool toBeDeprecated) = _ARExportFile;

  factory ARExportFile.fromJson(Map<String, dynamic> json) =>
      _$ARExportFileFromJson(json);
}
