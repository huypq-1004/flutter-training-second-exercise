import 'package:flutter/material.dart';
import 'package:my_list/pages/list_page.dart';
import 'package:my_list/view_models/list_page_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (context) => ListPageViewModel(),
        child: const ListPage(),
      ),
    );
  }
}
