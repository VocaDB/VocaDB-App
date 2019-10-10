import 'package:rxdart/rxdart.dart';
import 'package:vocadb/models/release_event_model.dart';
import 'package:vocadb/services/release_event_rest_service.dart';

class SearchReleaseEventBloc {
  final _query = BehaviorSubject<String>.seeded(null);
  final _results = BehaviorSubject<List<ReleaseEventModel>>.seeded(null);

  Observable get result$ => _results.stream;
  Observable get query$ => _query.stream;

  String get query => _query.value;

  ReleaseEventRestService releaseEventService = ReleaseEventRestService();

  SearchReleaseEventBloc() {
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

  void updateResults(List<ReleaseEventModel> results) {
    _results.add(results);
  }

  void fetch() {
    Map<String,String> params = {
      'query': query,
      'fields': 'MainPicture',
      'sort': 'AdditionDate',
      'maxResults': '50',
    };

    releaseEventService.list(params: params).then(updateResults);
  }

  void dispose() {
    _query.close();
    _results?.close();
  }
}
