import 'package:flutter/material.dart';
import 'package:flutter_image_search_02/data/model/photo.dart';
import 'package:flutter_image_search_02/data/repository/photo_repository_impl.dart';
import 'package:flutter_image_search_02/presentation/search_list/search_list_state.dart';

class SearchListViewModel with ChangeNotifier {
  final PhotoRepositoryImpl _photoRepositoryImpl;

  SearchListViewModel({required PhotoRepositoryImpl photoRepositoryImpl}) : _photoRepositoryImpl = photoRepositoryImpl;

  SearchListState _state = const SearchListState();
  SearchListState get state => _state;

  void onFetch() async {
    //_photo = await _photoRepositoryImpl.getPhotos('');
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    _state = state.copyWith(
      isLoading: false,
      photos: await _photoRepositoryImpl.getPhotos(''),
    );
    notifyListeners();
  }

  void onSearch(String query) async {
    //_photo = await _photoRepositoryImpl.getPhotos(query);
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    _state = state.copyWith(
      isLoading: false,
      photos: await _photoRepositoryImpl.getPhotos(query),
    );
    notifyListeners();
  }
}
