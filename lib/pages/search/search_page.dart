import 'package:flutter/material.dart';
import 'package:vocadb/blocs/search_bloc.dart';
import 'package:vocadb/models/entry_model.dart';
import 'package:vocadb/pages/search/search_album_filter_page.dart';
import 'package:vocadb/pages/search/search_artist_filter_page.dart';
import 'package:vocadb/pages/search/search_entry_filter_page.dart';
import 'package:vocadb/pages/search/search_song_filter_page.dart';
import 'package:vocadb/widgets/entry_tile.dart';
import 'package:vocadb/widgets/result.dart';

class SearchPage extends StatefulWidget {
  final SearchBloc bloc;

  const SearchPage({Key key, this.bloc}) : super(key: key);

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

  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }

  void onChangeEntryType(EntryType entryType) {
    widget.bloc.updateEntryType(entryType);
  }

  IconData getSuffixIcon() {
    switch (widget.bloc.entryType) {
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
                    selected: widget.bloc.entryType == EntryType.Undefined,
                    title: Text('Anything'),
                    onTap: () {
                      onChangeEntryType(EntryType.Undefined);
                      Navigator.pop(context);
                    }),
                ListTile(
                    leading: Icon(Icons.music_note),
                    selected: widget.bloc.entryType == EntryType.Song,
                    title: Text('Song'),
                    onTap: () {
                      onChangeEntryType(EntryType.Song);
                      Navigator.pop(context);
                    }),
                ListTile(
                    leading: Icon(Icons.person),
                    selected: widget.bloc.entryType == EntryType.Artist,
                    title: Text('Artist'),
                    onTap: () {
                      onChangeEntryType(EntryType.Artist);
                      Navigator.pop(context);
                    }),
                ListTile(
                    leading: Icon(Icons.album),
                    selected: widget.bloc.entryType == EntryType.Album,
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

  Widget buildStreamResult() {
    return StreamBuilder(
      stream: widget.bloc.resultStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SearchResult(entries: snapshot.data);
        } else if (snapshot.hasError) {
          return CenterError(message: snapshot.error.toString());
        }

        return CenterLoading();
      },
    );
  }

  void openFilterPage() {
    Widget filterPage;

    switch (widget.bloc.entryType) {
      case EntryType.Undefined:
        filterPage = SearchEntryFilterPage(bloc: widget.bloc.entryFilterBloc);
        break;
      case EntryType.Song:
        filterPage = SearchSongFilterPage(bloc: widget.bloc.songFilterBloc);
        break;
      case EntryType.Artist:
        filterPage = SearchArtistFilterPage(bloc: widget.bloc.artistFilterBloc);
        break;
      case EntryType.Album:
        filterPage = SearchAlbumFilterPage(bloc: widget.bloc.albumFilterBloc);
        break;
      default:
        return;
    }

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => filterPage));
  }

  @override
  Widget build(BuildContext context) {
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
                onChanged: widget.bloc.updateQuery,
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
        stream: widget.bloc.isSearching$,
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
