import 'package:get/get.dart';
import 'package:vocadb_app/controllers.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/repositories.dart';
import 'package:vocadb_app/services.dart';

class FavoriteAlbumController extends SearchPageController<AlbumUserModel> {
  /// Filter parameter
  final purchaseStatuses = ''.obs;

  /// Filter parameter
  final discType = ''.obs;

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

  final SharedPreferenceService sharedPreferenceService;

  FavoriteAlbumController(
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
    [purchaseStatuses, discType, sort, tags, artists]
        .forEach((element) => ever(element, (_) => initialFetch()));
    super.onInit();
  }

  Future<List<AlbumUserModel>> fetchApi({int start}) => userRepository
      .getAlbums(authService.currentUser().id,
          query: query.string,
          start: (start == null) ? 0 : start,
          maxResults: maxResults,
          discType: discType.string,
          purchaseStatuses: purchaseStatuses.string,
          sort: sort.string,
          lang: sharedPreferenceService.getContentLang,
          artistIds: artists.map((e) => e.id.toString()).toList(),
          tagIds: tags.map((e) => e.id.toString()).toList())
      .catchError(super.onError);
}
