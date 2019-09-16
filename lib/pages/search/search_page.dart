import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vocadb/models/entry_model.dart';
import 'package:vocadb/services/web_service.dart';
import 'package:vocadb/widgets/entry_tile.dart';
import 'package:vocadb/widgets/result.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String _query = '';

  TextEditingController _controller = TextEditingController();

  Timer _debounce;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      // do something with _searchQuery.text
      setState(() {
        _query = _controller.text;
      });
    });
  }

  @override
  void dispose() {
    _controller.removeListener(_onSearchChanged);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new TextField(
          autofocus: true,
          controller: _controller,
          style: Theme.of(context).primaryTextTheme.title,
          decoration:
              InputDecoration(border: InputBorder.none, hintText: "Search"),
        ),
      ),
      body: SearchResult(
        query: _query,
      ),
    );
  }
}

class EntryList {
  final List<EntryModel> entries;

  EntryList(this.entries);

  List<EntryModel> get songs =>
      entries.where((e) => e.entryType == EntryType.Song).toList();
  List<EntryModel> get artists =>
      entries.where((e) => e.entryType == EntryType.Artist).toList();
  List<EntryModel> get albums =>
      entries.where((e) => e.entryType == EntryType.Album).toList();
}

class SearchResult extends StatelessWidget {
  final String query;

  const SearchResult({Key key, this.query}) : super(key: key);

  Widget buildHasData(List<EntryModel> entries) {
    List<Widget> contents = [];

    EntryList entryList = EntryList(entries);

    if (entryList.songs.length > 0) {
      contents.add(buildSection('Songs', entryList.songs));
    }

    if (entryList.artists.length > 0) {
      contents.add(buildSection('Artists', entryList.artists));
    }

    if (entryList.albums.length > 0) {
      contents.add(buildSection('Albums', entryList.albums));
    }

    return ListView.builder(
      itemCount: contents.length,
      itemBuilder: (context, index) {
        return contents[index];
      },
    );
  }

  Widget buildSection(String title, List<EntryModel> entries) {
    List<Widget> children = [
      Container(
        margin: EdgeInsets.all(8.0),
        child: Text(title),
      )
    ];

    children.addAll(entries.map((e) => EntryTile(e)).toList());

    return Column(
      children: children,
    );
  }

  Widget buildError(Object error) {
    return Center(
      child: Result.error('Something wrong', subtitle: error.toString()),
    );
  }

  Widget buildDefault() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<EntryModel>>(
      future: WebService().load(EntryModel.query(this.query)),
      builder: (context, snapshot) {
        if (snapshot.hasData)
          return buildHasData(snapshot.data);
        else if (snapshot.hasError) {
          return buildError(snapshot.error);
        }

        return buildDefault();
      },
    );
  }
}
