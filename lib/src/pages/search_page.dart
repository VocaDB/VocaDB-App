import 'package:flutter/material.dart';
import 'package:vocadb_app/widgets.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Search'),
        ),
        body: EntryListView());
  }
}
