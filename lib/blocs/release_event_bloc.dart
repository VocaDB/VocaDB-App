import 'package:rxdart/rxdart.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/blocs/release_event_filter_bloc.dart';
import 'package:vocadb/models/release_event_model.dart';
import 'package:vocadb/services/release_event_rest_service.dart';

class ReleaseEventBloc {
  final _query = BehaviorSubject<String>.seeded(null);
  final _results = BehaviorSubject<List<ReleaseEventModel>>.seeded(null);
  final _searching = BehaviorSubject<bool>.seeded(false);
  final _noMoreResult = BehaviorSubject<bool>.seeded(false);
  int lastIndex = 0;

  Observable get result$ => _results.stream;
  Observable get query$ => _query.stream;
  Observable get searching$ => _searching.stream;
  Observable get noMoreResult$ => _noMoreResult.stream;

  String get query => _query.value;
  bool get noMoreResult => _noMoreResult.value;

  ReleaseEventRestService releaseEventService = ReleaseEventRestService();

  ConfigBloc configBloc;

  ReleaseEventFilterBloc releaseEventFilterBloc;

  ReleaseEventBloc({this.configBloc, this.releaseEventFilterBloc}) {
    releaseEventFilterBloc ??= ReleaseEventFilterBloc();

    Observable.merge([
      query$,
      releaseEventFilterBloc.params$,
    ]).debounceTime(Duration(milliseconds: 500)).listen(fetch);
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
    _noMoreResult.add(false);
    lastIndex = 0;
    releaseEventService.list(params: getCurrentParams()).then(updateResults);
  }

  Map<String, String> getCurrentParams() {
    Map<String, String> params = releaseEventFilterBloc.params();

    params['fields'] = 'MainPicture';
    params['nameMatchMode'] = 'Auto';
    params['maxResults'] = '50';
    params['lang'] = configBloc.contentLang;

    if (query != null && query.isNotEmpty) {
      params['query'] = query;
    }

    return params;
  }

  void fetchMore() {
    if (lastIndex == _results.value.length) {
      return;
    }

    lastIndex = _results.value.length;
    Map<String, String> params = getCurrentParams();
    params['start'] = lastIndex.toString();

    releaseEventService.list(params: params).then(appendResults);
  }

  void appendResults(List<ReleaseEventModel> moreResults) {
    if (moreResults.length == 0) {
      _noMoreResult.add(true);
      return;
    }

    List<ReleaseEventModel> currentResults = _results.value;
    currentResults.addAll(moreResults);
    _results.add(currentResults);
  }

  void dispose() {
    _query?.close();
    _results?.close();
    _searching?.close();
  }
}
