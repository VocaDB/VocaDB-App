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

enum SearchType { All, Song, Artist, Album }

class _SearchPageState extends State<SearchPage> {
  String _query = '';

  TextEditingController _controller = TextEditingController();

  SearchType _searchType = SearchType.All;

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

  void onChangeSearchType(SearchType searchType) {
    setState(() {
      _searchType = searchType;
    });
  }

  IconData getSuffixIcon() {
    switch (_searchType) {
      case SearchType.Song:
        return Icons.music_note;
      case SearchType.Artist:
        return Icons.person;
      case SearchType.Album:
        return Icons.album;
      default:
        return Icons.search;
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_onSearchChanged);
    _controller.dispose();
    super.dispose();
  }

  void _showModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: Icon(Icons.search),
                    selected: _searchType == SearchType.All,
                    title: Text('Anything'),
                    onTap: () {
                      onChangeSearchType(SearchType.All);
                      Navigator.pop(context);
                    }),
                ListTile(
                    leading: Icon(Icons.music_note),
                    selected: _searchType == SearchType.Song,
                    title: Text('Song'),
                    onTap: () {
                      onChangeSearchType(SearchType.Song);
                      Navigator.pop(context);
                    }),
                ListTile(
                    leading: Icon(Icons.person),
                    selected: _searchType == SearchType.Artist,
                    title: Text('Artist'),
                    onTap: () {
                      onChangeSearchType(SearchType.Artist);
                      Navigator.pop(context);
                    }),
                ListTile(
                    leading: Icon(Icons.album),
                    selected: _searchType == SearchType.Album,
                    title: Text('Album'),
                    onTap: () {
                      onChangeSearchType(SearchType.Album);
                      Navigator.pop(context);
                    }),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                autofocus: true,
                controller: _controller,
                style: Theme.of(context).primaryTextTheme.title,
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: "Search"),
              ),
            ),
            Container(
              width: 48,
              child: IconButton(
                icon: Icon(getSuffixIcon()),
                onPressed: () {
                  _showModalBottomSheet(context);
                },
              ),
            ),
          ],
        ),
      ),
      body: SearchResult(
        query: _query,
      ),
    );
  }
}

class SearchResult extends StatelessWidget {
  final String query;

  const SearchResult({Key key, this.query}) : super(key: key);

  Widget buildHasData(List<EntryModel> entries) {
    if (entries.isEmpty) return buildEmpty();

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

  Widget buildInitial() {
    return Center(
      child: Result(Icon(Icons.search, size: 48), 'Find anythings here.'),
    );
  }

  Widget buildEmpty() {
    return Center(
      child: Result(Icon(Icons.search, size: 48), 'Not results found.'),
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
