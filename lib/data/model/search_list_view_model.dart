import 'package:flutter/material.dart';
import 'package:flutter_image_search_02/data/model/photo.dart';
import 'package:flutter_image_search_02/data/repository/photo_repository_impl.dart';

class SearchListViewModel with ChangeNotifier {
  final PhotoRepositoryImpl _photoRepositoryImpl;

  SearchListViewModel({required PhotoRepositoryImpl photoRepositoryImpl}) : _photoRepositoryImpl = photoRepositoryImpl;

  List<Photo> _photo = [];
  List<Photo> get photo => List.unmodifiable(_photo);

  void onFetch() async {
    _photo = await _photoRepositoryImpl.getPhotos('');
    notifyListeners();
  }

  void onSearch(String query) async {
    _photo = await _photoRepositoryImpl.getPhotos(query);
    notifyListeners();
  }
}
