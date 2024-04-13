import 'package:json_annotation/json_annotation.dart';

import 'hit.dart';

part 'photo_dto.g.dart';

@JsonSerializable()
class PhotoDto {
  int? total;
  int? totalHits;
  List<Hit>? hits;

  PhotoDto({this.total, this.totalHits, this.hits});

  factory PhotoDto.fromJson(Map<String, dynamic> json) {
    return _$PhotoDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PhotoDtoToJson(this);
}
