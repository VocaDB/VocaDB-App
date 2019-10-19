import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:vocadb/blocs/search_artist_filter_bloc.dart';
import 'package:vocadb/models/tag_model.dart';
import 'package:vocadb/pages/search/search_tag_page.dart';
import 'package:vocadb/widgets/space_divider.dart';

class SearchArtistFilterPage extends StatelessWidget {
  final SearchArtistFilterBloc bloc;

  const SearchArtistFilterPage({Key key, this.bloc}) : super(key: key);

  void browseTags(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SearchTagPage(onSelected: bloc.addTag)));
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
                  );
                },
              ),
              SpaceDivider(),
              Title(
                text: FlutterI18n.translate(context, 'label.artistType'),
              ),
              StreamBuilder(
                stream: bloc.artistType$,
                builder: (context, snapshot) {
                  return ArtistTypeDropDown(
                    value: snapshot.data,
                    onChanged: bloc.updateArtistType,
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

class ArtistTypeDropDown extends StatelessWidget {
  final songTypes = const [
    {'name': 'Not specified', 'value': null},
    {'name': 'Circle', 'value': 'Circle'},
    {'name': 'Label', 'value': 'Label'},
    {'name': 'Music producer', 'value': 'Producer'},
    {'name': 'Animation producer', 'value': 'Animator'},
    {'name': 'Illustrator', 'value': 'Illustrator'},
    {'name': 'Lyricist', 'value': 'Lyricist'},
    {'name': 'Vocaloid', 'value': 'Vocaloid'},
    {'name': 'UTAU', 'value': 'UTAU'},
    {'name': 'CeVIO', 'value': 'CeVIO'},
    {'name': 'Other voice synthesizer', 'value': 'OtherVoiceSynthesizer'},
    {'name': 'Other vocalist', 'value': 'OtherVocalist'},
    {'name': 'Other group', 'value': 'OtherGroup'},
    {'name': 'Other individual', 'value': 'OtherIndividual'},
  ];

  final Function onChanged;
  final String value;

  const ArtistTypeDropDown({Key key, this.onChanged, this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        value: this.value,
        underline: Container(),
        items: songTypes
            .map((st) => DropdownMenuItem<String>(
                  value: st['value'],
                  child: Text(st['value'] == null
                      ? FlutterI18n.translate(context, 'label.notSpecified')
                      : FlutterI18n.translate(
                          context, 'artistType.${st['value']}')),
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
