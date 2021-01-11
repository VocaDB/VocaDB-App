import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/repositories.dart';

class SongSearchController extends GetxController {
  /// List of results from search
  final results = <SongModel>[].obs;

  /// Query input string
  final query = ''.obs;

  /// Set to True when user tap search icon.
  final openQuery = false.obs;

  /// Filter parameter
  final songType = 'Nothing'.obs;

  /// Filter parameter
  final sort = 'Nothing'.obs;

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
    fetchApi().then(results.addAll);
    [songType, sort, artists, tags]
        .forEach((element) => ever(element, (_) => fetchApi()));
    debounce(query, (_) => fetchApi(), time: Duration(seconds: 1));
    textSearchController = TextEditingController();
    super.onInit();
  }

  fetchApi() => songRepository.findSongs(
      start: (results.length == 0) ? results.length : results.length + 1,
      query: query.string,
      songType: songType.string,
      sort: sort.string,
      artistIds: artists.toList().map((e) => e.id).join(','),
      tagIds: tags.toList().map((e) => e.id).join(','));

  clearQuery() {
    query('');
    textSearchController.clear();
  }

  verifyShouldFetchMore(List<SongModel> items) {
    if (items == null || items.isEmpty) noFetchMore(true);
    return items;
  }

  onReachLastItem() {
    if (noFetchMore.value) return;

    fetchApi().then(verifyShouldFetchMore).then(results.addAll);
  }
}
