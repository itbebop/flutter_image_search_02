import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_image_search_02/data/model/search_list_view_model.dart';
import 'package:provider/provider.dart';

import '../photo_detail/photo_detail_screen.dart';
import 'component/image_card_widget.dart';

class SearchListScreen extends StatefulWidget {
  const SearchListScreen({super.key});

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
    final state = viewModel.state;

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
            child: state.isLoading
                ? const Center(child: CircularProgressIndicator())
                : GridView.count(
                    padding: const EdgeInsets.all(10),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    children: state.photos
                        .map(
                          (e) => GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PhotoDetailScreen(
                                    photo: e,
                                  ),
                                ),
                              );
                            },
                            child: Hero(
                                tag: e.id,
                                child: ImageCardWidget(
                                  photo: e,
                                )),
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
