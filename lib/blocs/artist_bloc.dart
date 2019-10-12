import 'package:rxdart/rxdart.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/blocs/search_artist_filter_bloc.dart';
import 'package:vocadb/models/artist_model.dart';
import 'package:vocadb/services/artist_rest_service.dart';

class ArtistBloc {
  final _query = BehaviorSubject<String>.seeded(null);
  final _results = BehaviorSubject<List<ArtistModel>>.seeded(null);
  final _searching = BehaviorSubject<bool>.seeded(false);

  Observable get result$ => _results.stream;
  Observable get query$ => _query.stream;
  Observable get searching$ => _searching.stream;

  String get query => _query.value;

  ArtistRestService artistService = ArtistRestService();

  ConfigBloc configBloc;

  SearchArtistFilterBloc artistFilterBloc;

  ArtistBloc({this.configBloc, this.artistFilterBloc}) {
    artistFilterBloc ??= SearchArtistFilterBloc();

    Observable.merge([
      query$,
      artistFilterBloc.params$,
    ]).debounceTime(Duration(milliseconds: 500)).distinct().listen(fetch);
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
    Map<String, String> params = artistFilterBloc.params();

    params['fields'] = 'MainPicture';
    params['nameMatchMode'] = 'Auto';
    params['maxResults'] = '50';
    params['lang'] = configBloc.contentLang;

    if (query != null && query.isNotEmpty) {
      params['query'] = query;
    }

    artistService.list(params: params).then(updateResults);
  }

  void dispose() {
    _query?.close();
    _results?.close();
    _searching?.close();
  }
}
