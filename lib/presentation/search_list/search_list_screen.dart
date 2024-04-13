import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_image_search_02/data/model/search_list_view_model.dart';
import 'package:provider/provider.dart';

class SearchListScreen extends StatefulWidget {
  final SearchListViewModel viewModel;
  const SearchListScreen({super.key, required this.viewModel});

  @override
  State<SearchListScreen> createState() => _SearchListScreenState();
}

class _SearchListScreenState extends State<SearchListScreen> {
  final _queryTextEditingController = TextEditingController();
  void updateUI() => setState(() {});

  @override
  void initState() {
    Future.microtask(() {
      final viewModel = context.read<SearchListViewModel>();
      viewModel.onFetch();
    });
    super.initState();
  }

  @override
  void dispose() {
    _queryTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SearchListViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('이미지 검색 2'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _queryTextEditingController,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: '검색어',
              suffixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  final query = _queryTextEditingController.text;
                  viewModel.onSearch(query);
                },
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(5),
              crossAxisCount: 2,
              children: viewModel.photo
                  .map(
                    (e) => ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        e.url,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
