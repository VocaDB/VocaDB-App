import 'package:get/get.dart';
import 'package:vocadb_app/controllers.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/repositories.dart';
import 'package:vocadb_app/services.dart';

class FavoriteSongController extends SearchPageController<RatedSongModel> {
  /// List of results from search
  final results = <RatedSongModel>[].obs;

  /// Filter parameter
  final sort = 'RatingDate'.obs;

  /// Filter parameter
  final rating = ''.obs;

  /// Filter parameter
  final groupByRating = false.obs;

  /// Filter parameter
  final artists = <ArtistModel>[].obs;

  /// Filter parameter
  final tags = <TagModel>[].obs;

  final UserRepository userRepository;

  final AuthService authService;

  final SharedPreferenceService sharedPreferenceService;

  FavoriteSongController(
      {this.userRepository,
      this.authService,
      SharedPreferenceService sharedPreferenceService})
      : sharedPreferenceService =
            sharedPreferenceService ?? Get.find<SharedPreferenceService>();

  @override
  void onInit() {
    if (authService.currentUser().id == null) {
      print('Error user not login yet.');
    }

    initialFetch();
    [rating, groupByRating, sort, artists, tags]
        .forEach((element) => ever(element, (_) => initialFetch()));
    super.onInit();
  }

  @override
  Future<List<RatedSongModel>> fetchApi({int start}) => userRepository
      .getRatedSongs(authService.currentUser().id,
          start: (start == null) ? 0 : start,
          maxResults: maxResults,
          lang: sharedPreferenceService.getContentLang,
          query: query.string,
          rating: rating.string,
          groupByRating: groupByRating.value,
          sort: sort.string,
          artistIds: artists.map((e) => e.id.toString()).toList(),
          tagIds: tags.map((e) => e.id.toString()).toList())
      .catchError(super.onError);
}
