import 'package:flutter/material.dart';
import 'package:vocadb/blocs/search_song_filter_bloc.dart';
import 'package:vocadb/models/tag_model.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Filter song')),
        body: Container(
          padding: EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              Title(
                text: 'Tags',
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
                  );
                },
              ),
              SpaceDivider(),
              Title(
                text: 'Song type',
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
                text: 'Sort',
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
                text: 'Artists',
              ),
              SpaceDivider(),
              FlatButton(
                onPressed: () {},
                child: Row(
                  children: <Widget>[Icon(Icons.add), Text('Add artist')],
                ),
              ),
            ],
          ),
        ));
  }
}

class TagFilters extends StatelessWidget {
  final Function onBrowseTags;
  final List<TagModel> tags;

  const TagFilters({Key key, this.onBrowseTags, this.tags}) : super(key: key);

  List<Widget> buildChildren(BuildContext context) {
    List<Widget> children = [];

    if (tags != null && tags.length > 0) {
      children.addAll(tags
          .map((t) => InputChip(
                label: Text(t.name),
                selected: true,
                onPressed: () {},
              ))
          .toList());
    }

    children.add(InputChip(
      label: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: <Widget>[Icon(Icons.add), Text('Add')],
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
  final songTypes = const [
    {'name': 'Not specified', 'value': null},
    {'name': 'Original song', 'value': 'Original'},
    {'name': 'Remaster', 'value': 'Remaster'},
    {'name': 'Remix', 'value': 'Remix'},
    {'name': 'Cover', 'value': 'Cover'},
    {'name': 'Instrumental', 'value': 'Instrumental'},
    {'name': 'Mashup', 'value': 'Mashup'},
    {'name': 'Music PV', 'value': 'MusicPV'},
    {'name': 'Drama PV', 'value': 'DramaPV'},
    {'name': 'Other', 'value': 'Other'},
  ];

  final Function onChanged;
  final String value;

  const SongTypeDropDown({Key key, this.onChanged, this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        value: this.value,
        underline: Container(),
        items: songTypes
            .map((st) => DropdownMenuItem<String>(
                  value: st['value'],
                  child: Text(st['name']),
                ))
            .toList(),
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
                  child: Text(st['name']),
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
