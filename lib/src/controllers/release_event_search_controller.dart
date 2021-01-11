import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/repositories.dart';
import 'package:vocadb_app/utils.dart';

class ReleaseEventSearchController extends GetxController {
  final int maxResults = 50;

  final initialLoading = true.obs;

  /// List of results from search
  final results = <ReleaseEventModel>[].obs;

  /// Query input string
  final query = ''.obs;

  /// Set to True when user tap search icon.
  final openQuery = false.obs;

  /// Filter parameter
  final category = 'Nothing'.obs;

  final sort = 'Name'.obs;

  final fromDate = Rx<DateTime>();

  final toDate = Rx<DateTime>();

  final artists = <ArtistModel>[].obs;

  final tags = <TagModel>[].obs;

  /// If set to [True], no fetch more data from server. Default is [False].
  final noFetchMore = false.obs;

  final ReleaseEventRepository releaseEventRepository;

  TextEditingController textSearchController;

  ReleaseEventSearchController({this.releaseEventRepository});

  @override
  void onInit() {
    initialFetch();
    [category, sort, artists, tags, fromDate, toDate]
        .forEach((element) => ever(element, (_) => initialFetch()));
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

  Future<List<ReleaseEventModel>> fetchApi({int start}) =>
      releaseEventRepository.findReleaseEvents(
        start: (start == null) ? 0 : start,
        maxResults: maxResults,
        query: query.string,
        category: category.string,
        sort: sort.string,
        artistIds: artists.toList().map((e) => e.id).join(','),
        tagIds: tags.toList().map((e) => e.id).join(','),
        beforeDate: DateTimeUtils.toUtcDateString(toDate.value),
        afterDate: DateTimeUtils.toUtcDateString(fromDate.value),
      );

  clearQuery() {
    query('');
    textSearchController.clear();
  }

  initialLoadingDone(_) => initialLoading(false);

  List<ReleaseEventModel> verifyShouldFetchMore(List<ReleaseEventModel> items) {
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
