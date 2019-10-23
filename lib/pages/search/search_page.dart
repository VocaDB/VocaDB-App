import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:provider/provider.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/blocs/search_bloc.dart';
import 'package:vocadb/models/entry_model.dart';
import 'package:vocadb/pages/search/search_entry_filter_page.dart';
import 'package:vocadb/widgets/center_content.dart';
import 'package:vocadb/widgets/entry_tile.dart';
import 'package:vocadb/widgets/result.dart';

class SearchScreen {
  static const String routeName = '/search';

  static void navigate(BuildContext context) {
    Navigator.pushNamed(context, SearchScreen.routeName);
  }
}

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  void onChangeEntryType(EntryType entryType) {
    Provider.of<SearchBloc>(context).updateEntryType(entryType);
  }

  void _showModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          final bloc = Provider.of<SearchBloc>(context);
          return Container(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: Icon(Icons.search),
                    selected: bloc.entryType == EntryType.Undefined,
                    title:
                        Text(FlutterI18n.translate(context, 'label.anything')),
                    onTap: () {
                      onChangeEntryType(EntryType.Undefined);
                      Navigator.pop(context);
                    }),
                ListTile(
                    leading: Icon(Icons.music_note),
                    selected: bloc.entryType == EntryType.Song,
                    title: Text(FlutterI18n.translate(context, 'label.song')),
                    onTap: () {
                      onChangeEntryType(EntryType.Song);
                      Navigator.pop(context);
                    }),
                ListTile(
                    leading: Icon(Icons.person),
                    selected: bloc.entryType == EntryType.Artist,
                    title:
                        Text(FlutterI18n.translate(context, 'label.artists')),
                    onTap: () {
                      onChangeEntryType(EntryType.Artist);
                      Navigator.pop(context);
                    }),
                ListTile(
                    leading: Icon(Icons.album),
                    selected: bloc.entryType == EntryType.Album,
                    title: Text(FlutterI18n.translate(context, 'label.album')),
                    onTap: () {
                      onChangeEntryType(EntryType.Album);
                      Navigator.pop(context);
                    }),
                ListTile(
                    leading: Icon(Icons.event),
                    selected: bloc.entryType == EntryType.ReleaseEvent,
                    title: Text(FlutterI18n.translate(context, 'label.event')),
                    onTap: () {
                      onChangeEntryType(EntryType.ReleaseEvent);
                      Navigator.pop(context);
                    }),
              ],
            ),
          );
        });
  }

  Widget buildStreamResult() {
    final bloc = Provider.of<SearchBloc>(context);

    return StreamBuilder(
      stream: bloc.resultStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SearchResult(entries: snapshot.data);
        } else if (snapshot.hasError) {
          return CenterResult.error(message: snapshot.error.toString());
        }

        return CenterLoading();
      },
    );
  }

  void openFilterPage() {
    final bloc = Provider.of<SearchBloc>(context);

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                SearchEntryFilterPage(bloc: bloc.entryFilterBloc)));
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<SearchBloc>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: openFilterPage,
        child: Icon(Icons.filter_list),
      ),
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                onChanged: bloc.updateQuery,
                autofocus: true,
                style: Theme.of(context).primaryTextTheme.title,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: FlutterI18n.translate(context, 'label.search')),
              ),
            ),
            Container(
              width: 48,
              child: IconButton(
                icon: StreamBuilder(
                  stream: bloc.entryTypeStream,
                  builder: (context, snapshot) {
                    switch (snapshot.data) {
                      case EntryType.Song:
                        return Icon(Icons.music_note);
                      case EntryType.Artist:
                        return Icon(Icons.person);
                      case EntryType.Album:
                        return Icon(Icons.album);
                      case EntryType.ReleaseEvent:
                        return Icon(Icons.event);
                      default:
                        return Icon(Icons.search);
                    }
                  },
                ),
                onPressed: () {
                  _showModalBottomSheet(context);
                },
              ),
            ),
          ],
        ),
      ),
      body: StreamBuilder(
        stream: bloc.isSearching$,
        builder: (context, snapshot) {
          return (snapshot.hasData && snapshot.data)
              ? buildStreamResult()
              : Center(
                  child: Text('Search anything here'),
                );
        },
      ),
    );
  }
}

class SearchResult extends StatelessWidget {
  final List<EntryModel> entries;

  const SearchResult({Key key, this.entries}) : super(key: key);

  Widget buildHasData(BuildContext context, List<EntryModel> entries) {
    if (entries.isEmpty) return buildEmpty(context);

    List<Widget> contents = [];

    EntryList entryList = EntryList(entries);

    if (entryList.songs.length > 0) {
      contents.add(buildSection(
          FlutterI18n.translate(context, 'label.songs'), entryList.songs));
    }

    if (entryList.artists.length > 0) {
      contents.add(buildSection(
          FlutterI18n.translate(context, 'label.artists'), entryList.artists));
    }

    if (entryList.albums.length > 0) {
      contents.add(buildSection(
          FlutterI18n.translate(context, 'label.albums'), entryList.albums));
    }

    if (entryList.releaseEvents.length > 0) {
      contents.add(buildSection(
          FlutterI18n.translate(context, 'label.releaseEvents'),
          entryList.releaseEvents));
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

  Widget buildEmpty(BuildContext context) {
    return Center(
      child: Result(Icon(Icons.search, size: 48),
          FlutterI18n.translate(context, 'error.searchResultNotMatched')),
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
    return buildHasData(context, this.entries);
  }
}
