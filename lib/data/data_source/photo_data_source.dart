import 'dart:convert';

import 'package:flutter_image_search_02/data/dto/photo_dto/photo_dto.dart';
import 'package:http/http.dart' as http;

class PhotoDataSource {
  final _baseUrl = 'https://pixabay.com/api';

  Future<PhotoDto> getPhotos(String query) async {
    final response = await http.get(Uri.parse('$_baseUrl?key=36206009-fe028570b3c99a317c543088c&q=$query&image_type=photo'));

    return PhotoDto.fromJson(jsonDecode(response.body));
  }
}
