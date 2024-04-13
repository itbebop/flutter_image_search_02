import 'package:flutter/material.dart';
import 'package:flutter_image_search_02/data/data_source/photo_data_source.dart';
import 'package:flutter_image_search_02/data/model/search_list_view_model.dart';
import 'package:flutter_image_search_02/data/repository/photo_repository_impl.dart';
import 'package:flutter_image_search_02/presentation/search_list/search_list_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: ChangeNotifierProvider(
        create: (_) {
          return SearchListViewModel(photoRepositoryImpl: PhotoRepositoryImpl(photoDataSource: PhotoDataSource()));
        },
        child: const SearchListScreen(),
      ),
    );
  }
}
