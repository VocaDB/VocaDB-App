import 'package:flutter/material.dart';
import 'package:vocadb/blocs/search_bloc.dart';
import 'package:vocadb/global_variables.dart';
import 'package:vocadb/models/entry_model.dart';
import 'package:vocadb/services/entry_service.dart';
import 'package:vocadb/widgets/entry_tile.dart';
import 'package:vocadb/widgets/result.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SearchBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = SearchBloc(EntryService(GlobalVariables.restService));
  }

  void onChangeEntryType(EntryType entryType) {
    bloc.updateEntryType(entryType);
  }

  IconData getSuffixIcon() {
    switch (bloc.entryType) {
      case EntryType.Song:
        return Icons.music_note;
      case EntryType.Artist:
        return Icons.person;
      case EntryType.Album:
        return Icons.album;
      default:
        return Icons.search;
    }
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
                    selected: bloc.entryType == EntryType.Undefined,
                    title: Text('Anything'),
                    onTap: () {
                      onChangeEntryType(EntryType.Undefined);
                      Navigator.pop(context);
                    }),
                ListTile(
                    leading: Icon(Icons.music_note),
                    selected: bloc.entryType == EntryType.Song,
                    title: Text('Song'),
                    onTap: () {
                      onChangeEntryType(EntryType.Song);
                      Navigator.pop(context);
                    }),
                ListTile(
                    leading: Icon(Icons.person),
                    selected: bloc.entryType == EntryType.Artist,
                    title: Text('Artist'),
                    onTap: () {
                      onChangeEntryType(EntryType.Artist);
                      Navigator.pop(context);
                    }),
                ListTile(
                    leading: Icon(Icons.album),
                    selected: bloc.entryType == EntryType.Album,
                    title: Text('Album'),
                    onTap: () {
                      onChangeEntryType(EntryType.Album);
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
                onChanged: bloc.updateQuery,
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
      body: StreamBuilder(
        stream: bloc.resultStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SearchResult(entries: snapshot.data);
          } else if (snapshot.hasError) {
            return CenterError(message: snapshot.error.toString());
          }

          return CenterLoading();
        },
      ),
    );
  }
}

class CenterLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class CenterError extends StatelessWidget {
  final String message;

  const CenterError({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Result(Icon(Icons.search, size: 48), message),
    );
  }
}

class SearchResult extends StatelessWidget {
  final List<EntryModel> entries;

  const SearchResult({Key key, this.entries}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return buildHasData(this.entries);
  }
}
