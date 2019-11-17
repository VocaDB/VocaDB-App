import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:vocadb/blocs/search_artist_filter_bloc.dart';
import 'package:vocadb/constants.dart';
import 'package:vocadb/models/tag_model.dart';
import 'package:vocadb/pages/search/search_tag_page.dart';
import 'package:vocadb/pages/search/tag_stream_filter.dart';
import 'package:vocadb/pages/setting/single_choice_page.dart';
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
              TagStreamFilters(
                tags$: bloc.tags$,
                onDeleteTag: (TagModel tag) {
                  bloc.removeTag(tag.id);
                },
                onBrowseTags: () => browseTags(context),
              ),
              Divider(),
              ArtistTypeSelector(
                value: bloc.artistType,
                onSelected: bloc.updateArtistType,
              ),
              Divider(),
              ArtistSortSelector(
                value: bloc.sort,
                onSelected: bloc.updateSort,
              ),
            ],
          ),
        ));
  }
}

class ArtistTypeSelector extends StatelessWidget {
  final String value;
  final Function onSelected;

  const ArtistTypeSelector({Key key, this.value, this.onSelected})
      : super(key: key);

  List<ChoiceOption> options(BuildContext context) {
    List<ChoiceOption> options = [];
    options.add(ChoiceOption(
        FlutterI18n.translate(context, 'label.notSpecified'), null));
    options.addAll(constArtistTypes
        .map((v) =>
            ChoiceOption(FlutterI18n.translate(context, 'artistType.$v'), v))
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
              title: FlutterI18n.translate(context, 'label.artistType'),
              options: options(context),
              value: value,
              onSelected: onSelected,
            );
          },
          title: Text(FlutterI18n.translate(context, 'label.artistType')),
          subtitle: Text((value == null)
              ? FlutterI18n.translate(context, 'label.notSpecified')
              : FlutterI18n.translate(context, 'artistType.$value')),
        ),
      ],
    );
  }
}

class ArtistSortSelector extends StatelessWidget {
  final String value;
  final Function onSelected;
  final values = const [
    'Name',
    'AdditionDate',
    'AdditionDateAsc',
    'ReleaseDate',
    'SongCount',
    'SongRating',
    'FollowerCount',
  ];

  const ArtistSortSelector({Key key, this.value, this.onSelected})
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
