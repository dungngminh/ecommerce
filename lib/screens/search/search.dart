import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  static const routeName = '/search/search.dart';
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Search"),),
    );
  }
}
