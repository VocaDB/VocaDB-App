import 'package:rxdart/rxdart.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/blocs/search_album_filter_bloc.dart';
import 'package:vocadb/models/album_model.dart';
import 'package:vocadb/services/album_rest_service.dart';

class AlbumBloc {
  final _query = BehaviorSubject<String>.seeded(null);
  final _results = BehaviorSubject<List<AlbumModel>>.seeded(null);
  final _searching = BehaviorSubject<bool>.seeded(false);
  final _noMoreResult = BehaviorSubject<bool>.seeded(false);
  int lastIndex = 0;

  Observable get result$ => _results.stream;
  Observable get query$ => _query.stream;
  Observable get searching$ => _searching.stream;
  Observable get noMoreResult$ => _noMoreResult.stream;

  String get query => _query.value;
  bool get noMoreResult => _noMoreResult.value;

  AlbumRestService albumService = AlbumRestService();

  ConfigBloc configBloc;

  SearchAlbumFilterBloc albumFilterBloc;

  AlbumBloc({this.configBloc, this.albumFilterBloc}) {
    albumFilterBloc ??= SearchAlbumFilterBloc();

    Observable.merge([
      query$,
      albumFilterBloc.params$,
    ]).debounceTime(Duration(milliseconds: 500)).listen(fetch);
  }

  void openSearch() {
    _searching.add(true);
  }

  void updateQuery(String query) {
    _query.add(query);
  }

  void updateResults(List<AlbumModel> results) {
    _results.add(results);
  }

  void fetch(dynamic event) {
    _noMoreResult.add(false);
    lastIndex = 0;
    albumService.list(params: getCurrentParams()).then(updateResults);
  }

  Map<String, String> getCurrentParams() {
    Map<String, String> params = albumFilterBloc.params();

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

    albumService.list(params: params).then(appendResults);
  }

  void appendResults(List<AlbumModel> moreResults) {
    if (moreResults.length == 0) {
      _noMoreResult.add(true);
      return;
    }

    List<AlbumModel> currentResults = _results.value;
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
