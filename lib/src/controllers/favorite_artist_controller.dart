import 'package:get/get.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/repositories.dart';
import 'package:vocadb_app/services.dart';

class FavoriteArtistController extends GetxController {
  final int maxResults = 50;

  final initialLoading = true.obs;

  /// List of results from search
  final results = <FollowedArtistModel>[].obs;

  /// Filter parameter
  final artistType = ''.obs;

  /// Filter parameter
  final tags = <TagModel>[].obs;

  /// If set to [True], no fetch more data from server. Default is [False].
  final noFetchMore = false.obs;

  final UserRepository userRepository;

  final AuthService authService;

  FavoriteArtistController({this.userRepository, this.authService});

  @override
  void onInit() {
    if (authService.currentUser().id == null) {
      print('Error user not login yet.');
    }
    initialFetch();
    [artistType, tags]
        .forEach((element) => ever(element, (_) => initialFetch()));
    super.onInit();
  }

  void initialFetch() {
    Future.value(noFetchMore(false))
        .then((_) => fetchApi())
        .then(verifyShouldFetchMore)
        .then(results)
        .then(initialLoadingDone);
  }

  Future<List<FollowedArtistModel>> fetchApi({int start}) =>
      userRepository.getFollowedArtists(authService.currentUser().id,
          start: (start == null) ? 0 : start,
          maxResults: maxResults,
          lang: SharedPreferenceService.lang,
          artistType: artistType.string,
          tagIds: tags.toList().map((e) => e.id).join(','));

  initialLoadingDone(_) => initialLoading(false);

  List<FollowedArtistModel> verifyShouldFetchMore(
      List<FollowedArtistModel> items) {
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
