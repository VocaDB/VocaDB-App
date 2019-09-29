import 'package:rxdart/rxdart.dart';
import 'package:vocadb/models/artist_model.dart';
import 'package:vocadb/services/artist_rest_service.dart';

class SearchArtistBloc {
  final _query = BehaviorSubject<String>.seeded(null);
  final _results = BehaviorSubject<List<ArtistModel>>.seeded(null);

  Observable get result$ => _results.stream;
  Observable get query$ => _query.stream;

  String get query => _query.value;

  ArtistRestService artistService = ArtistRestService();

  SearchArtistBloc() {
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

  void updateResults(List<ArtistModel> results) {
    _results.add(results);
  }

  void fetch() {
    artistService.search(query).then(updateResults);
  }

  void dispose() {
    _query?.close();
    _results?.close();
  }
}
