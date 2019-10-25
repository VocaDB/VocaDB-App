import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:vocadb/blocs/search_song_filter_bloc.dart';
import 'package:vocadb/constants.dart';
import 'package:vocadb/models/artist_model.dart';
import 'package:vocadb/models/tag_model.dart';
import 'package:vocadb/pages/search/search_artist_page.dart';
import 'package:vocadb/pages/search/search_tag_page.dart';
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
              Title(
                text: FlutterI18n.translate(context, 'label.tags'),
              ),
              SpaceDivider(),
              StreamBuilder(
                stream: bloc.tags$,
                builder: (context, snapshot) {
                  List<TagModel> tags = (snapshot.hasData)
                      ? (snapshot.data as Map<int, TagModel>).values.toList()
                      : [];

                  return TagFilters(
                    tags: tags,
                    onBrowseTags: () {
                      browseTags(context);
                    },
                    onDeleteTag: (TagModel t) {
                      bloc.removeTag(t.id);
                    },
                  );
                },
              ),
              SpaceDivider(),
              Title(
                text: FlutterI18n.translate(context, 'label.songType'),
              ),
              StreamBuilder(
                stream: bloc.songType$,
                builder: (context, snapshot) {
                  return SongTypeDropDown(
                    value: snapshot.data,
                    onChanged: bloc.updateSongType,
                  );
                },
              ),
              SpaceDivider(),
              Title(
                text: FlutterI18n.translate(context, 'label.sort'),
              ),
              StreamBuilder(
                stream: bloc.sort$,
                builder: (context, snapshot) {
                  return SongSortDropDown(
                    value: snapshot.data ?? 'Name',
                    onChanged: bloc.updateSort,
                  );
                },
              ),
              SpaceDivider(),
              Title(
                text: FlutterI18n.translate(context, 'label.artists'),
              ),
              SpaceDivider(),
              StreamBuilder(
                stream: bloc.artists$,
                builder: (context, snapshot) {
                  List<ArtistModel> artists = (snapshot.hasData)
                      ? (snapshot.data as Map<int, ArtistModel>).values.toList()
                      : [];

                  return ArtistFilters(
                    artists: artists,
                    onRemove: bloc.removeArtist,
                    onBrowseArtists: () {
                      browseArtists(context);
                    },
                  );
                },
              ),
            ],
          ),
        ));
  }
}

class ArtistFilters extends StatelessWidget {
  final List<ArtistModel> artists;
  final Function onBrowseArtists;
  final Function onRemove;

  const ArtistFilters(
      {Key key, this.artists, this.onBrowseArtists, this.onRemove})
      : super(key: key);

  List<Widget> buildChildren(BuildContext context) {
    List<Widget> children = [];

    if (artists != null && artists.length > 0) {
      children.addAll(artists
          .map((t) => ListTile(
                onTap: () {},
                trailing: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    this.onRemove(t.id);
                  },
                ),
                leading: buildLeading(t.imageUrl),
                title: Text(t.name),
                subtitle: Text(t.artistType),
              ))
          .toList());
    }

    children.add(ListTile(
      onTap: this.onBrowseArtists,
      leading: Icon(Icons.add),
      title: Text(FlutterI18n.translate(context, 'label.add')),
    ));

    return children;
  }

  Widget buildLeading(String imageUrl) {
    return SizedBox(
      width: 50,
      height: 50,
      child: ClipOval(
          child: Container(
        color: Colors.white,
        child: (imageUrl == null)
            ? Placeholder()
            : CachedNetworkImage(
                imageUrl: imageUrl,
                placeholder: (context, url) => Container(color: Colors.grey),
                errorWidget: (context, url, error) => new Icon(Icons.error),
              ),
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: buildChildren(context),
    );
  }
}

class TagFilters extends StatelessWidget {
  final Function onBrowseTags;
  final List<TagModel> tags;
  final Function onDeleteTag;

  const TagFilters({Key key, this.onBrowseTags, this.tags, this.onDeleteTag})
      : super(key: key);

  List<Widget> buildChildren(BuildContext context) {
    List<Widget> children = [];

    if (tags != null && tags.length > 0) {
      children.addAll(tags
          .map((t) => Chip(
                label: Text(t.name),
                onDeleted: () {
                  this.onDeleteTag(t);
                },
                deleteIcon: Icon(Icons.close),
              ))
          .toList());
    }

    children.add(InputChip(
      label: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: <Widget>[
          Icon(Icons.add),
          Text(FlutterI18n.translate(context, 'label.add'))
        ],
      ),
      onPressed: this.onBrowseTags,
    ));

    return children;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      children: buildChildren(context),
    );
  }
}

class SongTypeDropDown extends StatelessWidget {

  final Function onChanged;
  final String value;

  const SongTypeDropDown({Key key, this.onChanged, this.value})
      : super(key: key);

  List<DropdownMenuItem<String>> dropDownItems(BuildContext context) {
    List<DropdownMenuItem<String>> items = [];
    items.add(defaultItem(context));
    items.addAll(constSongTypes.map((v) => createItem(context, v)).toList());
    
    return items;
  }

  DropdownMenuItem<String> defaultItem(BuildContext context) {
    return DropdownMenuItem<String>(
      value: null,
      child: Text(FlutterI18n.translate(context, 'label.notSpecified')),
    );
  }

  DropdownMenuItem<String> createItem(BuildContext context, String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(FlutterI18n.translate(context, 'songType.$value')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        value: this.value,
        underline: Container(),
        items: dropDownItems(context),
        onChanged: this.onChanged);
  }
}

class SongSortDropDown extends StatelessWidget {
  final sorts = const [
    {'name': 'Name', 'value': 'Name'},
    {'name': 'Addition date', 'value': 'AdditionDate'},
    {'name': 'Publish date', 'value': 'PublishDate'},
    {'name': 'Time favorited', 'value': 'FavoritedTimes'},
    {'name': 'Rating score', 'value': 'RatingScore'},
  ];

  final Function onChanged;
  final String value;

  const SongSortDropDown({Key key, this.onChanged, this.value = 'Name'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        value: this.value,
        underline: Container(),
        items: sorts
            .map((st) => DropdownMenuItem<String>(
                  value: st['value'],
                  child: Text(
                      FlutterI18n.translate(context, 'sort.${st['value']}')),
                ))
            .toList(),
        onChanged: this.onChanged);
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
