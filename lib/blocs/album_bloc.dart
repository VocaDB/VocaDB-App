import 'package:rxdart/rxdart.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/blocs/search_album_filter_bloc.dart';
import 'package:vocadb/models/album_model.dart';
import 'package:vocadb/services/album_rest_service.dart';

class AlbumBloc {
  final _query = BehaviorSubject<String>.seeded(null);
  final _results = BehaviorSubject<List<AlbumModel>>.seeded(null);
  final _searching = BehaviorSubject<bool>.seeded(false);

  Observable get result$ => _results.stream;
  Observable get query$ => _query.stream;
  Observable get searching$ => _searching.stream;

  String get query => _query.value;

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
    Map<String, String> params = albumFilterBloc.params();

    params['fields'] = 'MainPicture';
    params['nameMatchMode'] = 'Auto';
    params['maxResults'] = '50';
    params['lang'] = configBloc.contentLang;

    if (query != null && query.isNotEmpty) {
      params['query'] = query;
    }

    albumService.list(params: params).then(updateResults);
  }

  void dispose() {
    _query?.close();
    _results?.close();
    _searching?.close();
  }
}
