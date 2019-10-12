import 'package:rxdart/rxdart.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/blocs/release_event_filter_bloc.dart';
import 'package:vocadb/models/release_event_model.dart';
import 'package:vocadb/services/release_event_rest_service.dart';

class ReleaseEventBloc {
  final _query = BehaviorSubject<String>.seeded(null);
  final _results = BehaviorSubject<List<ReleaseEventModel>>.seeded(null);
  final _searching = BehaviorSubject<bool>.seeded(false);

  Observable get result$ => _results.stream;
  Observable get query$ => _query.stream;
  Observable get searching$ => _searching.stream;

  String get query => _query.value;

  ReleaseEventRestService releaseEventService = ReleaseEventRestService();

  ConfigBloc configBloc;

  ReleaseEventFilterBloc releaseEventFilterBloc;

  ReleaseEventBloc({this.configBloc, this.releaseEventFilterBloc}) {
    releaseEventFilterBloc ??= ReleaseEventFilterBloc();

    Observable.merge([
      query$,
      releaseEventFilterBloc.params$,
    ]).debounceTime(Duration(milliseconds: 500)).distinct().listen(fetch);
  }

  void openSearch() {
    _searching.add(true);
  }

  void updateQuery(String query) {
    _query.add(query);
  }

  void updateResults(List<ReleaseEventModel> results) {
    _results.add(results);
  }

  void fetch(dynamic event) {
    print(event);
    Map<String, String> params = releaseEventFilterBloc.params();

    params['fields'] = 'MainPicture';
    params['nameMatchMode'] = 'Auto';
    params['maxResults'] = '50';
    params['lang'] = configBloc.contentLang;

    if (query != null && query.isNotEmpty) {
      params['query'] = query;
    }

    releaseEventService.list(params: params).then(updateResults);
  }

  void dispose() {
    _query?.close();
    _results?.close();
    _searching?.close();
  }
}
