import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:provider/provider.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/blocs/event_series_bloc.dart';
import 'package:vocadb/models/release_event_model.dart';
import 'package:vocadb/models/release_event_series_model.dart';
import 'package:vocadb/widgets/event_tile.dart';
import 'package:vocadb/widgets/section.dart';
import 'package:vocadb/widgets/text_info_section.dart';

class EventSeriesScreenArguments {
  final ReleaseEventSeriesModel eventSeriesModel;

  EventSeriesScreenArguments(this.eventSeriesModel);
}

class EventSeriesScreen extends StatelessWidget {
  static const String routeName = '/eventSeriesDetail';

  static void navigate(BuildContext context, ReleaseEventSeriesModel eventSeriesModel) {
    Navigator.pushNamed(context, EventSeriesScreen.routeName,
        arguments: EventSeriesScreenArguments(eventSeriesModel));
  }

  @override
  Widget build(BuildContext context) {
    final EventSeriesScreenArguments args =
        ModalRoute.of(context).settings.arguments;
    final configBloc = Provider.of<ConfigBloc>(context);
    
    return Provider<EventSeriesBloc>(
      builder: (context) =>
          EventSeriesBloc(args.eventSeriesModel.id, configBloc: configBloc),
      dispose: (context, bloc) => bloc.dispose(),
      child: EventSeriesPage(eventSeriesModel: args.eventSeriesModel,),
    );
  }
}

class EventSeriesPage extends StatelessWidget {
  final ReleaseEventSeriesModel eventSeriesModel;

  const EventSeriesPage({Key key, this.eventSeriesModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(eventSeriesModel.name),),
      body: ListView(
        children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextInfoSection(
                      title: FlutterI18n.translate(context, 'label.category'),
                      text: FlutterI18n.translate(context,
                          'eventCategory.${eventSeriesModel.category}'),
                    ),
                    TextInfoSection(
                      title: FlutterI18n.translate(context, 'label.description'),
                      text: FlutterI18n.translate(context,
                          'eventCategory.${eventSeriesModel.description}'),
                    )
                  ],
                ),
              ),
              StreamBuilder(
                stream: Provider.of<EventSeriesBloc>(context).events$,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return Container();

                  List<ReleaseEventModel> releaseEvents = snapshot.data;
                  return Section(
                    title: FlutterI18n.translate(context, 'label.events'),
                    children: releaseEvents
                        .map((e) => EventTile.fromReleaseEvent(e,
                            tag: 'even_series_event_${e.id}'))
                        .toList(),
                  );
                },
              ),
            ],
      ),
    );
  }
}
