import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/arguments.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/repositories.dart';
import 'package:vocadb_app/services.dart';

class TagSearchController extends GetxController {
  final int maxResults = 50;

  final initialLoading = true.obs;

  /// List of results from search
  final results = <TagModel>[].obs;

  /// Query input string
  final query = ''.obs;

  final category = ''.obs;

  /// Set to True when user tap search icon.
  final openQuery = false.obs;

  /// If set to [True], no fetch more data from server. Default is [False].
  final noFetchMore = false.obs;

  final TagRepository tagRepository;

  TextEditingController textSearchController;

  TagSearchController({this.tagRepository});

  @override
  void onInit() {
    initArgs();
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

  initArgs() {
    final TagSearchArgs args = Get.arguments;
    category(args.category);
    print(args);
  }

  Future<List<TagModel>> fetchApi({int start}) => tagRepository.findTags(
      start: (start == null) ? 0 : start,
      lang: SharedPreferenceService.lang,
      maxResults: maxResults,
      query: query.string,
      categoryName: category.string);

  clearQuery() {
    query('');
    textSearchController.clear();
  }

  initialLoadingDone(_) => initialLoading(false);

  List<TagModel> verifyShouldFetchMore(List<TagModel> items) {
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
