import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:vocadb/blocs/release_event_filter_bloc.dart';
import 'package:vocadb/constants.dart';
import 'package:vocadb/models/artist_model.dart';
import 'package:vocadb/models/tag_model.dart';
import 'package:vocadb/pages/search/artist_stream_filter.dart';
import 'package:vocadb/pages/search/search_artist_page.dart';
import 'package:vocadb/pages/search/search_tag_page.dart';
import 'package:vocadb/pages/search/tag_stream_filter.dart';
import 'package:vocadb/pages/setting/single_choice_page.dart';

class ReleaseEventFilterPage extends StatelessWidget {
  final ReleaseEventFilterBloc bloc;

  const ReleaseEventFilterPage({Key key, this.bloc}) : super(key: key);

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

  void selectFromDate(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2005),
            lastDate: DateTime(2030))
        .then(bloc.updateFromDate);
  }

  void selectToDate(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2005),
            lastDate: DateTime(2030))
        .then(bloc.updateToDate);
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
              Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 0, 0),
                child: Text(
                  FlutterI18n.translate(context, 'label.date'),
                  style: Theme.of(context).textTheme.subhead,
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).cardColor,
                        padding: EdgeInsets.all(16.0),
                        onPressed: () => selectFromDate(context),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.calendar_today),
                            Container(
                              width: 8,
                            ),
                            StreamBuilder(
                              stream: bloc.fromDate$,
                              builder: (context, snapshot) {
                                if (snapshot.hasData && snapshot.data != '') {
                                  return Text(snapshot.data);
                                }

                                return Text(FlutterI18n.translate(
                                    context, 'label.from'));
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.0),
                      child: Text('-'),
                    ),
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).cardColor,
                        padding: EdgeInsets.all(16.0),
                        onPressed: () => selectToDate(context),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.calendar_today),
                            Container(
                              width: 8,
                            ),
                            StreamBuilder(
                              stream: bloc.toDate$,
                              builder: (context, snapshot) {
                                if (snapshot.hasData && snapshot.data != '') {
                                  return Text(snapshot.data);
                                }

                                return Text(
                                    FlutterI18n.translate(context, 'label.to'));
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              ReleaseEventCategorySelector(
                value: bloc.category,
                onSelected: bloc.updateCategory,
              ),
              ReleaseEventSortSelector(
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

class ReleaseEventCategorySelector extends StatelessWidget {
  final String value;
  final Function onSelected;

  const ReleaseEventCategorySelector({Key key, this.value, this.onSelected})
      : super(key: key);

  List<ChoiceOption> options(BuildContext context) {
    List<ChoiceOption> options = [];
    options.add(ChoiceOption(
        FlutterI18n.translate(context, 'label.notSpecified'), null));
    options.addAll(constEventCategories
        .map((v) =>
            ChoiceOption(FlutterI18n.translate(context, 'eventCategory.$v'), v))
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
              title: FlutterI18n.translate(context, 'label.category'),
              options: options(context),
              value: value,
              onSelected: onSelected,
            );
          },
          title: Text(FlutterI18n.translate(context, 'label.category')),
          subtitle: Text((value == null)
              ? FlutterI18n.translate(context, 'label.notSpecified')
              : FlutterI18n.translate(context, 'eventCategory.$value')),
        ),
      ],
    );
  }
}

class ReleaseEventSortSelector extends StatelessWidget {
  final String value;
  final Function onSelected;
  final values = const ['Name', 'Date', 'AdditionDate'];

  const ReleaseEventSortSelector({Key key, this.value, this.onSelected})
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
