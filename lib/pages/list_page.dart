import 'package:flutter/material.dart';
import 'package:my_list/pages/detail_page.dart';
import 'package:my_list/view_models/detail_page_view_model.dart';
import 'package:my_list/view_models/list_page_view_model.dart';
import 'package:my_list/views/list_view_item.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  void _onItemTapped(BuildContext context, int index) {
    var movie = context.read<ListPageViewModel>().movies[index];
    var movieGenres = context.read<ListPageViewModel>().movieGenres;
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (context) => DetailPageViewModel(
                      movie: movie, movieGenres: movieGenres),
                  child: const DetailPage(),
                )));
  }

  @override
  Widget build(BuildContext context) {
    context.read<ListPageViewModel>().onListPageInit();
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            AppStrings.listPageTitle,
          ),
        ),
        body: Container(
          color: Colors.white,
          child: ListView.builder(
              itemCount: context.watch<ListPageViewModel>().movies.length,
              itemBuilder: (BuildContext context, int index) {
                var movie = context.watch<ListPageViewModel>().movies[index];
                return ListViewItem(
                  title: movie.title,
                  overview: movie.overview,
                  imageURL: movie.posterURL,
                  onTap: () => {_onItemTapped(context, index)},
                );
              }),
        ));
  }
}
