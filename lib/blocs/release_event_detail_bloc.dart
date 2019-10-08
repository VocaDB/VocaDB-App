import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/models/release_event_model.dart';
import 'package:vocadb/services/release_event_rest_service.dart';

class ReleaseEventDetailBloc {
  final _releaseEvents = BehaviorSubject<ReleaseEventModel>();

  final int id;

  Observable get releaseEvent$ => _releaseEvents.stream;

  ReleaseEventRestService releaseEventService;

  ConfigBloc configBloc;

  ReleaseEventDetailBloc(this.id,
      {ReleaseEventRestService releaseEventService, this.configBloc}) {
    this.releaseEventService ??=
        releaseEventService ?? ReleaseEventRestService();

    fetch();
  }

  Future<void> fetch() async {
    return releaseEventService
        .byId(this.id, lang: configBloc.contentLang)
        .then(_releaseEvents.add);
  }

  void dispose() {
    _releaseEvents?.close();
  }
}
