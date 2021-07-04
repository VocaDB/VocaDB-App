import 'package:get/get.dart';
import 'package:vocadb_app/controllers.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/repositories.dart';
import 'package:vocadb_app/services.dart';

class FavoriteArtistController
    extends SearchPageController<FollowedArtistModel> {
  /// Filter parameter
  final artistType = ''.obs;

  /// Filter parameter
  final tags = <TagModel>[].obs;

  final UserRepository userRepository;

  final AuthService authService;

  final SharedPreferenceService sharedPreferenceService;

  FavoriteArtistController(
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
    [artistType, tags]
        .forEach((element) => ever(element, (_) => initialFetch()));
    super.onInit();
  }

  Future<List<FollowedArtistModel>> fetchApi({int start}) => userRepository
      .getFollowedArtists(authService.currentUser().id,
          query: query.string,
          start: (start == null) ? 0 : start,
          maxResults: maxResults,
          lang: sharedPreferenceService.getContentLang,
          artistType: artistType.string,
          tagIds: tags.map((e) => e.id.toString()).toList())
      .catchError(super.onError);
}
