import 'package:rxdart/rxdart.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/models/tag_model.dart';
import 'package:vocadb/services/tag_rest_service.dart';

class TagBloc {
  final _query = BehaviorSubject<String>.seeded(null);
  final _results = BehaviorSubject<List<TagModel>>.seeded(null);
  final _searching = BehaviorSubject<bool>.seeded(false);

  Observable get result$ => _results.stream;
  Observable get query$ => _query.stream;
  Observable get searching$ => _searching.stream;

  String get query => _query.value;

  TagRestService tagService = TagRestService();

  ConfigBloc configBloc;

  TagBloc({this.configBloc}) {
    Observable.merge([
      query$,
    ]).debounceTime(Duration(milliseconds: 500)).distinct().listen(fetch);
  }

  void openSearch() {
    _searching.add(true);
  }

  void updateQuery(String query) {
    _query.add(query);
  }

  void updateResults(List<TagModel> results) {
    _results.add(results);
  }

  void fetch(dynamic event) {
    Map<String, String> params = {};

    params['nameMatchMode'] = 'Auto';
    params['maxResults'] = '50';
    params['lang'] = configBloc.contentLang;

    if (query != null && query.isNotEmpty) {
      params['query'] = query;
    }

    tagService.list(params: params).then(updateResults);
  }

  void dispose() {
    _query?.close();
    _results?.close();
    _searching?.close();
  }
}
