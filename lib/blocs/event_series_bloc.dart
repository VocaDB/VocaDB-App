import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/models/release_event_series_model.dart';
import 'package:vocadb/services/release_event_series_rest_service.dart';

class EventSeriesBloc {
  final _eventSeriesDetail = BehaviorSubject<ReleaseEventSeriesModel>();

  Observable get eventSeriesDetail$ => _eventSeriesDetail.stream;

  final int id;

  ReleaseEventSeriesRestService releaseEventSeriesService;

  ConfigBloc configBloc;

  EventSeriesBloc(this.id,
      {ReleaseEventSeriesRestService releaseEventSeriesService, this.configBloc}) {
    this.releaseEventSeriesService ??=
        releaseEventSeriesService ?? ReleaseEventSeriesRestService();

    fetchEventSeriesDetail();
  }

  Future<void> fetchEventSeriesDetail() async {
    return releaseEventSeriesService
        .byId(this.id, lang: configBloc.contentLang)
        .then(_eventSeriesDetail.add);
  }

  void dispose() {
    _eventSeriesDetail?.close();
  }
}
