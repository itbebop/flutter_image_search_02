import 'package:flutter_image_search_02/data/data_source/photo_data_source.dart';
import 'package:flutter_image_search_02/data/mapper/photo_mapper.dart';
import 'package:flutter_image_search_02/data/model/photo.dart';
import 'package:flutter_image_search_02/data/repository/photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _photoDataSource;
  PhotoRepositoryImpl({required PhotoDataSource photoDataSource}) : _photoDataSource = photoDataSource;

  @override
  Future<List<Photo>> getPhotos(String query) async {
    final dto = await _photoDataSource.getPhotos(query);

    if (dto.hits == null) {
      return [];
    }
    return dto.hits!.map((e) => e.toPhoto()).toList();
  }
}
