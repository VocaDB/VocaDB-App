import 'package:rxdart/rxdart.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/models/song_model.dart';
import 'package:vocadb/services/song_rest_service.dart';

class SearchSongBloc {
  final _query = BehaviorSubject<String>.seeded(null);
  final _results = BehaviorSubject<List<SongModel>>.seeded(null);

  Observable get result$ => _results.stream;
  Observable get query$ => _query.stream;

  String get query => _query.value;

  SongRestService songService = SongRestService();

  Map<String, String> params;
  ConfigBloc configBloc;

  SearchSongBloc({this.params = const {}, this.configBloc}) {
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

  void updateResults(List<SongModel> results) {
    _results.add(results);
  }

  void fetch() {
    params['query'] = query;
    songService.list(params: params).then(updateResults);
  }

  void dispose() {
    _query?.close();
    _results?.close();
  }
}
