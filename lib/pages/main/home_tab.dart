import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/blocs/home_bloc.dart';
import 'package:vocadb/blocs/search_bloc.dart';
import 'package:vocadb/models/release_event_model.dart';
import 'package:vocadb/pages/album/album_page.dart';
import 'package:vocadb/pages/artist/artist_page.dart';
import 'package:vocadb/pages/main/highlighted_list.dart';
import 'package:vocadb/pages/main/latest_album_list.dart';
import 'package:vocadb/pages/main/top_album_list.dart';
import 'package:vocadb/pages/release_event/release_event_page.dart';
import 'package:vocadb/pages/search/search_page.dart';
import 'package:vocadb/pages/song/song_page.dart';
import 'package:vocadb/pages/tag/tag_page.dart';
import 'package:vocadb/widgets/event_tile.dart';
import 'package:vocadb/widgets/section.dart';

class HomeTab extends StatefulWidget {

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: SearchBar(),
          ),
          Wrap(
            runSpacing: 12.0,
            children: <Widget>[
              ShortcutMenuButton(title: 'Songs', iconData: Icons.music_note, onPressed: () => SongScreen.navigate(context)),
              ShortcutMenuButton(title: 'Artists', iconData: Icons.person, onPressed: () => ArtistScreen.navigate(context)),
              ShortcutMenuButton(title: 'Albums', iconData: Icons.album, onPressed: () => AlbumScreen.navigate(context)),
              ShortcutMenuButton(title: 'Tags', iconData: Icons.label, onPressed: () => TagScreen.navigate(context)),
              ShortcutMenuButton(title: 'Events', iconData: Icons.event, onPressed: () => ReleaseEventScreen.navigate(context)),
            ],
          ),
          HighlightedList(),
          LatestAlbumList(),
          TopAlbumList(),
          StreamBuilder(
              stream: Provider.of<HomeBloc>(context).recentEvents$,
              builder: (context, snapshot) {
                if (!snapshot.hasData) return Container();

                List<ReleaseEventModel> releaseEvents = snapshot.data;
                return Section(
                  title: 'Recent events',
                  children: releaseEvents.map((e) => EventTile.fromEntry(e, tag: 'recent_event_${e.id}')).toList(),
                );
              },
            ),
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final configBloc = Provider.of<ConfigBloc>(context);

    final searchPage = SearchPage(bloc: SearchBloc(configBloc: configBloc));

    return SizedBox(
      height: 48.0,
      width: double.infinity,
      child: Material(
        color: theme.cardColor,
        elevation: 3,
        child: InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => searchPage));
          },
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Row(
              children: <Widget>[
                Icon(Icons.search, color: theme.iconTheme.color),
                SizedBox(width: 8,),
                Text('Search anything')
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class ShortcutMenuButton extends StatelessWidget {

  final String title;
  final IconData iconData;
  final Function onPressed;

  const ShortcutMenuButton({Key key, this.title, this.iconData, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
                children: <Widget>[
                  RawMaterialButton(
                    onPressed: this.onPressed,
                    child: Icon(
                      iconData,
                      color: Theme.of(context).iconTheme.color,
                      size: 24.0,
                    ),
                    shape: CircleBorder(),
                    elevation: 2.0,
                    fillColor: Theme.of(context).cardColor,
                    padding: const EdgeInsets.all(15.0),
                  ),
                  Text(title)
                ],
              );
  }
}