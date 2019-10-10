import 'package:rxdart/rxdart.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/models/album_model.dart';
import 'package:vocadb/services/album_rest_service.dart';

class SearchAlbumBloc {
  final _query = BehaviorSubject<String>.seeded(null);
  final _results = BehaviorSubject<List<AlbumModel>>.seeded(null);

  Observable get result$ => _results.stream;
  Observable get query$ => _query.stream;

  String get query => _query.value;

  AlbumRestService albumService = AlbumRestService();

  Map<String, String> params;
  ConfigBloc configBloc;

  SearchAlbumBloc({this.params, this.configBloc}) {

    if(this.params == null) {
      params = {
        'sort': 'Date',
        'fields': 'MainPicture',
      };
    }
    _query
        .debounceTime(Duration(milliseconds: 500))
        .distinct()
        .listen(onQueryChanged);
  }

  void onQueryChanged(String query) {
    fetch();
  }

  void updateQuery(String query) {
    _query.add(query);
  }

  void updateResults(List<AlbumModel> results) {
    _results.add(results);
  }

  void fetch() {
    params['query'] = query;
    albumService.list(params: params).then(updateResults);
  }

  void dispose() {
    _query?.close();
    _results?.close();
  }
}
