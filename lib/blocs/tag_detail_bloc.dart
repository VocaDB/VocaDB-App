import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/models/tag_model.dart';
import 'package:vocadb/services/tag_rest_service.dart';

class TagDetailBloc {
  final _tag = BehaviorSubject<TagModel>();

  final int id;

  Observable get tag$ => _tag.stream;

  TagRestService tagService;

  ConfigBloc configBloc;

  TagDetailBloc(this.id,
      {TagRestService tagService, this.configBloc}) {
    this.tagService ??= tagService ?? TagRestService();

    fetch();
  }

  Future<void> fetch() async {
    return tagService
        .byId(this.id, lang: configBloc.contentLang)
        .then(_tag.add);
  }

  void dispose() {
    _tag?.close();
  }
}
