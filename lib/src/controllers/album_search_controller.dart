import 'package:get/get.dart';
import 'package:vocadb_app/controllers.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/repositories.dart';
import 'package:vocadb_app/services.dart';

class AlbumSearchController extends SearchPageController<AlbumModel> {
  /// Filter parameter
  final discType = ''.obs;

  final sort = 'Name'.obs;

  final artists = <ArtistModel>[].obs;

  final tags = <TagModel>[].obs;

  final AlbumRepository albumRepository;

  final SharedPreferenceService sharedPreferenceService;

  AlbumSearchController(
      {this.albumRepository, SharedPreferenceService sharedPreferenceService})
      : sharedPreferenceService =
            sharedPreferenceService ?? Get.find<SharedPreferenceService>();

  @override
  void onInit() {
    [discType, sort, artists, tags]
        .forEach((element) => ever(element, (_) => initialFetch()));
    super.onInit();
  }

  Future<List<AlbumModel>> fetchApi({int start}) => albumRepository
      .findAlbums(
          start: (start == null) ? 0 : start,
          lang: sharedPreferenceService.getContentLang,
          maxResults: maxResults,
          query: query.string,
          discType: discType.string,
          sort: sort.string,
          artistIds: artists.map((e) => e.id.toString()).toList(),
          tagIds: tags.map((e) => e.id.toString()).toList())
      .catchError(super.onError);
}
