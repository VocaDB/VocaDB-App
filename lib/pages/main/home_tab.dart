import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:provider/provider.dart';
import 'package:vocadb/blocs/home_bloc.dart';
import 'package:vocadb/models/release_event_model.dart';
import 'package:vocadb/pages/album/album_page.dart';
import 'package:vocadb/pages/artist/artist_page.dart';
import 'package:vocadb/pages/main/highlighted_list.dart';
import 'package:vocadb/pages/main/latest_album_list.dart';
import 'package:vocadb/pages/main/top_album_list.dart';
import 'package:vocadb/pages/release_event/release_event_page.dart';
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
          SizedBox(
            height: 16,
          ),
          Center(
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.start,
              runAlignment: WrapAlignment.center,
              runSpacing: 24.0,
              children: <Widget>[
                ShortcutMenuButton(
                    title: FlutterI18n.translate(context, 'label.songs'),
                    iconData: Icons.music_note,
                    onPressed: () => SongScreen.navigate(context)),
                ShortcutMenuButton(
                    title: FlutterI18n.translate(context, 'label.artists'),
                    iconData: Icons.person,
                    onPressed: () => ArtistScreen.navigate(context)),
                ShortcutMenuButton(
                    title: FlutterI18n.translate(context, 'label.albums'),
                    iconData: Icons.album,
                    onPressed: () => AlbumScreen.navigate(context)),
                ShortcutMenuButton(
                    title: FlutterI18n.translate(context, 'label.tags'),
                    iconData: Icons.label,
                    onPressed: () => TagScreen.navigate(context)),
                ShortcutMenuButton(
                    title: FlutterI18n.translate(context, 'label.events'),
                    iconData: Icons.event,
                    onPressed: () => ReleaseEventScreen.navigate(context)),
              ],
            ),
          ),
          SizedBox(
            height: 8,
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
                title: FlutterI18n.translate(context, 'label.upcomingEvent'),
                children: releaseEvents
                    .map((e) => EventTile.fromReleaseEvent(e,
                        tag: 'recent_event_${e.id}'))
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ShortcutMenuButton extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Function onPressed;

  const ShortcutMenuButton({Key key, this.title, this.iconData, this.onPressed})
      : super(key: key);

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
