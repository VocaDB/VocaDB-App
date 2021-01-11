import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/repositories.dart';
import 'package:vocadb_app/services.dart';

class ArtistSearchController extends GetxController {
  final int maxResults = 50;

  final initialLoading = true.obs;

  /// List of results from search
  final results = <ArtistModel>[].obs;

  /// Query input string
  final query = ''.obs;

  /// Set to True when user tap search icon.
  final openQuery = false.obs;

  /// Filter parameter
  final artistType = ''.obs;

  final sort = 'Name'.obs;

  final tags = <TagModel>[].obs;

  /// If set to [True], no fetch more data from server. Default is [False].
  final noFetchMore = false.obs;

  final ArtistRepository artistRepository;

  TextEditingController textSearchController;

  ArtistSearchController({this.artistRepository});

  @override
  void onInit() {
    initialFetch();
    [artistType, sort, tags]
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

  Future<List<ArtistModel>> fetchApi({int start}) =>
      artistRepository.findArtists(
        start: (start == null) ? 0 : start,
        lang: SharedPreferenceService.lang,
        maxResults: maxResults,
        query: query.string,
        artistType: artistType.string,
        sort: sort.string,
        tagIds: tags.toList().map((e) => e.id).join(','),
      );

  clearQuery() {
    query('');
    textSearchController.clear();
  }

  initialLoadingDone(_) => initialLoading(false);

  List<ArtistModel> verifyShouldFetchMore(List<ArtistModel> items) {
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
