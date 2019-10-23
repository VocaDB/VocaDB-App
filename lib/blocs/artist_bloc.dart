import 'package:rxdart/rxdart.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/blocs/search_artist_filter_bloc.dart';
import 'package:vocadb/models/artist_model.dart';
import 'package:vocadb/services/artist_rest_service.dart';

class ArtistBloc {
  final _query = BehaviorSubject<String>.seeded(null);
  final _results = BehaviorSubject<List<ArtistModel>>.seeded(null);
  final _searching = BehaviorSubject<bool>.seeded(false);
  final _noMoreResult = BehaviorSubject<bool>.seeded(false);
  int lastIndex = 0;

  Observable get result$ => _results.stream;
  Observable get query$ => _query.stream;
  Observable get searching$ => _searching.stream;
  Observable get noMoreResult$ => _noMoreResult.stream;

  String get query => _query.value;
  bool get noMoreResult => _noMoreResult.value;

  ArtistRestService artistService = ArtistRestService();

  ConfigBloc configBloc;

  SearchArtistFilterBloc artistFilterBloc;

  ArtistBloc({this.configBloc, this.artistFilterBloc}) {
    artistFilterBloc ??= SearchArtistFilterBloc();

    Observable.merge([
      query$,
      artistFilterBloc.params$,
    ]).debounceTime(Duration(milliseconds: 500)).listen(fetch);
  }

  void openSearch() {
    _searching.add(true);
  }

  void updateQuery(String query) {
    _query.add(query);
  }

  void updateResults(List<ArtistModel> results) {
    _results.add(results);
  }

  void fetch(dynamic event) {
    _noMoreResult.add(false);
    lastIndex = 0;
    artistService.list(params: getCurrentParams()).then(updateResults);
  }

  Map<String, String> getCurrentParams() {
    Map<String, String> params = artistFilterBloc.params();

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

    artistService.list(params: params).then(appendResults);
  }

  void appendResults(List<ArtistModel> moreResults) {
    if (moreResults.length == 0) {
      _noMoreResult.add(true);
      return;
    }

    List<ArtistModel> currentResults = _results.value;
    currentResults.addAll(moreResults);
    _results.add(currentResults);
  }

  void dispose() {
    _query?.close();
    _results?.close();
    _searching?.close();
    _noMoreResult?.close();
  }
}
