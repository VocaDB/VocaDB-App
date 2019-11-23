import 'package:rxdart/rxdart.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/models/tag_model.dart';
import 'package:vocadb/services/tag_rest_service.dart';

class TagBloc {
  final _query = BehaviorSubject<String>.seeded(null);
  final _results = BehaviorSubject<List<TagModel>>.seeded(null);
  final _searching = BehaviorSubject<bool>.seeded(false);
  final _noMoreResult = BehaviorSubject<bool>.seeded(false);
  final _selectedCategory = BehaviorSubject<String>();
  final _categoryNames = BehaviorSubject<List>();
  int lastIndex = 0;

  Observable get result$ => _results.stream;
  Observable get query$ => _query.stream;
  Observable get searching$ => _searching.stream;
  Observable get noMoreResult$ => _noMoreResult.stream;
  Observable get selectedCategory$ => _selectedCategory.stream;
  Observable get categoryNames$ => _categoryNames.stream;

  String get query => _query.value;
  bool get noMoreResult => _noMoreResult.value;

  TagRestService tagService = TagRestService();

  ConfigBloc configBloc;

  TagBloc({this.configBloc, String category}) {
    if (category == null || category.isEmpty) {
      fetchCategoryNames();
    } else {
      _selectedCategory.add(category);
    }

    Observable.merge([
      query$,
      selectedCategory$,
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
    _noMoreResult.add(false);
    lastIndex = 0;
    tagService.list(params: getCurrentParams()).then(updateResults);
  }

  Map<String, String> getCurrentParams() {
    Map<String, String> params = {};

    params['nameMatchMode'] = 'Auto';
    params['maxResults'] = '50';
    params['lang'] = configBloc.contentLang;

    if (_selectedCategory.value != null) {
      params['categoryName'] = _selectedCategory.value;
    }

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

    tagService.list(params: params).then(appendResults);
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

  void fetchCategoryNames() {
    tagService.categoryNames().then(_categoryNames.add);
  }

  void dispose() {
    _query?.close();
    _results?.close();
    _searching?.close();
    _selectedCategory?.close();
    _categoryNames?.close();
  }
}
