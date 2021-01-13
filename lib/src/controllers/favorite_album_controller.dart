import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/repositories.dart';
import 'package:vocadb_app/services.dart';

class FavoriteAlbumController extends GetxController {
  final int maxResults = 50;

  final initialLoading = true.obs;

  /// List of results from search
  final results = <AlbumUserModel>[].obs;

  /// Query input string
  final query = ''.obs;

  /// Set to True when user tap search icon.
  final openQuery = false.obs;

  /// Filter parameter
  final purchaseStatuses = ''.obs;

  /// Filter parameter
  final discType = 'Nothing'.obs;

  /// Filter parameter
  final sort = 'Name'.obs;

  /// Filter parameter
  final tags = <TagModel>[].obs;

  /// Filter parameter
  final artists = <ArtistModel>[].obs;

  /// If set to [True], no fetch more data from server. Default is [False].
  final noFetchMore = false.obs;

  final UserRepository userRepository;

  final AuthService authService;

  TextEditingController textSearchController;

  FavoriteAlbumController({this.userRepository, this.authService});

  @override
  void onInit() {
    if (authService.currentUser().id == null) {
      print('Error user not login yet.');
    }
    initialFetch();
    [purchaseStatuses, discType, sort, tags, artists]
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

  Future<List<AlbumUserModel>> fetchApi({int start}) =>
      userRepository.getAlbums(authService.currentUser().id,
          start: (start == null) ? 0 : start,
          maxResults: maxResults,
          discType: discType.string,
          purchaseStatuses: purchaseStatuses.string,
          sort: sort.string,
          lang: SharedPreferenceService.lang,
          artistIds: artists.toList().map((e) => e.id).join(','),
          tagIds: tags.toList().map((e) => e.id).join(','));

  clearQuery() {
    query('');
    textSearchController.clear();
  }

  @override
  void onClose() {
    textSearchController.dispose();
    super.onClose();
  }

  initialLoadingDone(_) => initialLoading(false);

  List<AlbumUserModel> verifyShouldFetchMore(List<AlbumUserModel> items) {
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
