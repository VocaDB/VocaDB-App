import 'package:rxdart/rxdart.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/blocs/search_song_filter_bloc.dart';
import 'package:vocadb/models/song_model.dart';
import 'package:vocadb/services/song_rest_service.dart';

class SongBloc {
  final _query = BehaviorSubject<String>.seeded(null);
  final _results = BehaviorSubject<List<SongModel>>.seeded(null);
  final _searching = BehaviorSubject<bool>.seeded(false);

  Observable get result$ => _results.stream;
  Observable get query$ => _query.stream;
  Observable get searching$ => _searching.stream;

  String get query => _query.value;

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

  void fetch(dynamic event) {
    Map<String, String> params = songFilterBloc.params();

    params['fields'] = 'PVs,MainPicture,ThumbUrl';
    params['nameMatchMode'] = 'Auto';
    params['maxResults'] = '50';
    params['lang'] = configBloc.contentLang;

    if (query != null && query.isNotEmpty) {
      params['query'] = query;
    }

    songService.list(params: params).then(updateResults);
  }

  void dispose() {
    _query?.close();
    _results?.close();
    _searching?.close();
  }
}
