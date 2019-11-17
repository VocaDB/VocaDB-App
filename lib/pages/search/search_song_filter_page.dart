import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:vocadb/blocs/search_song_filter_bloc.dart';
import 'package:vocadb/constants.dart';
import 'package:vocadb/models/artist_model.dart';
import 'package:vocadb/models/tag_model.dart';
import 'package:vocadb/pages/search/artist_stream_filter.dart';
import 'package:vocadb/pages/search/search_artist_page.dart';
import 'package:vocadb/pages/search/search_tag_page.dart';
import 'package:vocadb/pages/search/tag_stream_filter.dart';
import 'package:vocadb/pages/setting/single_choice_page.dart';
import 'package:vocadb/widgets/space_divider.dart';

class SearchSongFilterPage extends StatelessWidget {
  final SearchSongFilterBloc bloc;

  const SearchSongFilterPage({Key key, this.bloc}) : super(key: key);

  void browseTags(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SearchTagPage(onSelected: bloc.addTag)));
  }

  void browseArtists(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                SearchArtistPage(onSelected: bloc.addArtist)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(title: Text(FlutterI18n.translate(context, 'label.filter'))),
        body: Container(
          padding: EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              TagStreamFilters(
                tags$: bloc.tags$,
                onDeleteTag: (TagModel tag) {
                  bloc.removeTag(tag.id);
                },
                onBrowseTags: () => browseTags(context),
              ),
              Divider(),
              SongTypeSelector(
                value: bloc.songType,
                onSelected: bloc.updateSongType,
              ),
              SongSortSelector(
                value: bloc.sort,
                onSelected: bloc.updateSort,
              ),
              Divider(),
              ArtistStreamFilters(
                artists$: bloc.artists$,
                onDeleteArtist: (ArtistModel artist) {
                  bloc.removeArtist(artist.id);
                },
                onBrowseArtists: () => browseArtists(context),
              ),
            ],
          ),
        ));
  }
}

class SongTypeSelector extends StatelessWidget {
  final String value;
  final Function onSelected;

  const SongTypeSelector({Key key, this.value, this.onSelected})
      : super(key: key);

  List<ChoiceOption> options(BuildContext context) {
    List<ChoiceOption> options = [];
    options.add(ChoiceOption(
        FlutterI18n.translate(context, 'label.notSpecified'), null));
    options.addAll(constSongTypes
        .map((v) =>
            ChoiceOption(FlutterI18n.translate(context, 'songType.$v'), v))
        .toList());

    return options;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          onTap: () {
            SingleChoicePage.navigate(
              context,
              title: FlutterI18n.translate(context, 'label.songType'),
              options: options(context),
              value: value,
              onSelected: onSelected,
            );
          },
          title: Text(FlutterI18n.translate(context, 'label.songType')),
          subtitle: Text((value == null)
              ? FlutterI18n.translate(context, 'label.notSpecified')
              : FlutterI18n.translate(context, 'songType.$value')),
        ),
      ],
    );
  }
}

class SongSortSelector extends StatelessWidget {
  final String value;
  final Function onSelected;
  final values = const [
    'Name',
    'AdditionDate',
    'PublishDate',
    'FavoritedTimes',
    'RatingScore'
  ];

  const SongSortSelector({Key key, this.value, this.onSelected})
      : super(key: key);

  List<ChoiceOption> options(BuildContext context) {
    List<ChoiceOption> options = [];
    options.add(ChoiceOption(
        FlutterI18n.translate(context, 'label.notSpecified'), null));
    options.addAll(values
        .map((v) => ChoiceOption(FlutterI18n.translate(context, 'sort.$v'), v))
        .toList());

    return options;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          onTap: () {
            SingleChoicePage.navigate(
              context,
              title: FlutterI18n.translate(context, 'label.sort'),
              options: options(context),
              value: value,
              onSelected: onSelected,
            );
          },
          title: Text(FlutterI18n.translate(context, 'label.sort')),
          subtitle: Text((value == null)
              ? FlutterI18n.translate(context, 'label.notSpecified')
              : FlutterI18n.translate(context, 'sort.$value')),
        ),
      ],
    );
  }
}

class Title extends StatelessWidget {
  final String text;

  const Title({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(this.text, style: Theme.of(context).textTheme.caption);
  }
}
