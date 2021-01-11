import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/repositories.dart';

class SongSearchController extends GetxController {
  final int maxResults = 50;

  final initialLoading = true.obs;

  /// List of results from search
  final results = <SongModel>[].obs;

  /// Query input string
  final query = ''.obs;

  /// Set to True when user tap search icon.
  final openQuery = false.obs;

  /// Filter parameter
  final songType = ''.obs;

  /// Filter parameter
  final sort = 'Name'.obs;

  /// Filter parameter
  final artists = <ArtistModel>[].obs;

  /// Filter parameter
  final tags = <TagModel>[].obs;

  /// If set to [True], no fetch more data from server. Default is [False].
  final noFetchMore = false.obs;

  final SongRepository songRepository;

  TextEditingController textSearchController;

  SongSearchController({this.songRepository});

  @override
  void onInit() {
    initialFetch();
    [songType, sort, artists, tags]
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

  Future<List<SongModel>> fetchApi({int start}) => songRepository.findSongs(
      start: (start == null) ? 0 : start,
      query: query.string,
      songType: songType.string,
      sort: sort.string,
      artistIds: artists.toList().map((e) => e.id).join(','),
      tagIds: tags.toList().map((e) => e.id).join(','));

  clearQuery() {
    query('');
    textSearchController.clear();
  }

  initialLoadingDone(_) => initialLoading(false);

  List<SongModel> verifyShouldFetchMore(List<SongModel> items) {
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
