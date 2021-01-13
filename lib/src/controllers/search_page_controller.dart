import 'package:flutter/material.dart';
import 'package:vocadb_app/controllers.dart';
import 'package:get/get.dart';

abstract class SearchPageController<T> extends AppPageController {
  final int maxResults = 50;

  /// List of results from search
  final results = <T>[].obs;

  /// Query input string
  final query = ''.obs;

  /// Set to True when user tap search icon.
  final openQuery = false.obs;

  /// If set to [True], no fetch more data from server. Default is [False].
  final noFetchMore = false.obs;

  TextEditingController textSearchController;

  @override
  void onInit() {
    initialFetch();
    debounce(query, (_) => initialFetch(), time: Duration(seconds: 1));
    textSearchController = TextEditingController();
    super.onInit();
  }

  void initialFetch() {
    Future.value(noFetchMore(false))
        .then((_) => fetchApi())
        .then(verifyShouldFetchMore)
        .then(results)
        .then(initialLoadingDone);
  }

  void clearQuery() {
    query('');
    textSearchController.clear();
  }

  Future<List<T>> fetchApi({int start});

  List<T> verifyShouldFetchMore(List<T> items) {
    if (items == null || items.isEmpty || items.length < maxResults)
      noFetchMore(true);
    return items;
  }

  onReachLastItem() {
    if (noFetchMore.value) return;
    fetchApi(start: results.length + 1)
        .then(verifyShouldFetchMore)
        .then(results.addAll);
  }
}
