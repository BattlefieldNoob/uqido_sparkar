import 'package:freezed_annotation/freezed_annotation.dart';

part 'picture.freezed.dart';
part 'picture.g.dart';

@freezed
class Picture with _$Picture {
  factory Picture(String uri) = _Picture;

  factory Picture.fromJson(Map<String, dynamic> json) =>
      _$PictureFromJson(json);
}
