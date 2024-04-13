import 'package:flutter/material.dart';
import 'package:flutter_image_search_02/presentation/search_list/search_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: SearchListScreen(),
    );
  }
}
