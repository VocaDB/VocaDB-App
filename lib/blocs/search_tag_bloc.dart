import 'package:rxdart/rxdart.dart';
import 'package:vocadb/models/tag_model.dart';
import 'package:vocadb/services/tag_rest_service.dart';

class SearchTagBloc {
  final _query = BehaviorSubject<String>.seeded(null);
  final _results = BehaviorSubject<List<TagModel>>.seeded(null);

  Observable get result$ => _results.stream;
  Observable get query$ => _query.stream;

  String get query => _query.value;

  TagRestService tagService = TagRestService();

  SearchTagBloc() {
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

  void updateResults(List<TagModel> results) {
    _results.add(results);
  }

  void fetch() {
    tagService.search(query).then(updateResults);
  }

  void dispose() {
    _query.close();
    _results?.close();
  }
}
