import 'package:flutter_image_search_02/data/dto/photo_dto/hit.dart';
import 'package:flutter_image_search_02/data/model/photo.dart';

extension ToPhoto on Hit {
  Photo toPhoto() {
    return Photo(
      id: id?.toInt() ?? 0,
      url: previewUrl ?? '',
      tags: tags ?? '',
    );
  }
}
