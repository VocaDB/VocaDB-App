import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/models/release_event_model.dart';
import 'package:vocadb/services/release_event_rest_service.dart';

class EventSeriesBloc {
  final _releaseEvents = BehaviorSubject<List<ReleaseEventModel>>();

  final int id;

  Observable get events$ => _releaseEvents.stream;

  ReleaseEventRestService releaseEventService;

  ConfigBloc configBloc;

  EventSeriesBloc(this.id,
      {ReleaseEventRestService releaseEventService, this.configBloc}) {
    this.releaseEventService ??=
        releaseEventService ?? ReleaseEventRestService();

    fetchEventInSeries();
  }

  Future<void> fetchEventInSeries() async {
    return releaseEventService
        .bySeriesId(this.id, lang: configBloc.contentLang)
        .then(_releaseEvents.add);
  }

  void dispose() {
    _releaseEvents?.close();
  }
}
