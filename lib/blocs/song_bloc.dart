import 'package:rxdart/rxdart.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/blocs/search_song_filter_bloc.dart';
import 'package:vocadb/models/song_model.dart';
import 'package:vocadb/services/song_rest_service.dart';

class SongBloc {
  final _query = BehaviorSubject<String>.seeded(null);
  final _results = BehaviorSubject<List<SongModel>>.seeded(null);
  final _searching = BehaviorSubject<bool>.seeded(false);
  final _noMoreResult = BehaviorSubject<bool>.seeded(false);
  int lastIndex = 0;

  Observable get result$ => _results.stream;
  Observable get query$ => _query.stream;
  Observable get searching$ => _searching.stream;
  Observable get noMoreResult$ => _noMoreResult.stream;

  String get query => _query.value;
  bool get noMoreResult => _noMoreResult.value;

  SongRestService songService = SongRestService();

  ConfigBloc configBloc;

  SearchSongFilterBloc songFilterBloc;

  SongBloc({this.configBloc, this.songFilterBloc}) {
    songFilterBloc ??= SearchSongFilterBloc();

    Observable.merge([
      query$,
      songFilterBloc.params$,
    ]).debounceTime(Duration(milliseconds: 500)).listen(fetch);
  }

  void openSearch() {
    _searching.add(true);
  }

  void updateQuery(String query) {
    _query.add(query);
  }

  void updateResults(List<SongModel> results) {
    _results.add(results);
  }

  void appendResults(List<SongModel> moreResults) {
    if (moreResults.length == 0) {
      _noMoreResult.add(true);
      return;
    }

    List<SongModel> currentResults = _results.value;
    currentResults.addAll(moreResults);
    _results.add(currentResults);
  }

  void fetch(dynamic event) {
    _noMoreResult.add(false);
    lastIndex = 0;
    Map<String, String> params = getCurrentParams();

    songService.list(params: params).then(updateResults);
  }

  Map<String, String> getCurrentParams() {
    Map<String, String> params = songFilterBloc.params();

    params['fields'] = 'PVs,MainPicture,ThumbUrl';
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

    songService.list(params: params).then(appendResults);
  }

  void dispose() {
    _query?.close();
    _results?.close();
    _searching?.close();
    _noMoreResult?.close();
  }
}
