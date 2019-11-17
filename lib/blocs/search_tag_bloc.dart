import 'package:rxdart/rxdart.dart';
import 'package:vocadb/models/tag_model.dart';
import 'package:vocadb/services/tag_rest_service.dart';

class SearchTagBloc {
  final _query = BehaviorSubject<String>.seeded(null);
  final _results = BehaviorSubject<List<TagModel>>.seeded(null);
  final _noMoreResult = BehaviorSubject<bool>.seeded(false);
  int lastIndex = 0;

  Observable get result$ => _results.stream;
  Observable get query$ => _query.stream;
  Observable get noMoreResult$ => _noMoreResult.stream;

  String get query => _query.value;
  bool get noMoreResult => _noMoreResult.value;

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
    tagService.list(params: getCurrentParams()).then(updateResults);
  }

  Map<String, String> getCurrentParams() {
    Map<String, String> params = {};

    params['nameMatchMode'] = 'Auto';
    params['maxResults'] = '50';

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

    tagService.list(params: params).then((items) {
      appendResults(items);
    });
  }

  void appendResults(List<TagModel> moreResults) {
    if (moreResults.length == 0) {
      _noMoreResult.add(true);
      return;
    }

    List<TagModel> currentResults = _results.value;
    currentResults.addAll(moreResults);
    _results.add(currentResults);
  }

  void dispose() {
    _query.close();
    _results?.close();
  }
}
