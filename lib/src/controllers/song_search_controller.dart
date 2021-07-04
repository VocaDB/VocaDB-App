import 'package:get/get.dart';
import 'package:vocadb_app/controllers.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/repositories.dart';
import 'package:vocadb_app/services.dart';

class SongSearchController extends SearchPageController<SongModel> {
  /// Filter parameter
  final songType = ''.obs;

  /// Filter parameter
  final sort = 'Name'.obs;

  /// Filter parameter
  final artists = <ArtistModel>[].obs;

  /// Filter parameter
  final tags = <TagModel>[].obs;

  final SongRepository songRepository;

  final SharedPreferenceService sharedPreferenceService;

  SongSearchController(
      {this.songRepository, SharedPreferenceService sharedPreferenceService})
      : sharedPreferenceService =
            sharedPreferenceService ?? Get.find<SharedPreferenceService>();

  @override
  void onInit() {
    [songType, sort, artists, tags]
        .forEach((element) => ever(element, (_) => initialFetch()));
    super.onInit();
  }

  @override
  Future<List<SongModel>> fetchApi({int start}) => songRepository
      .findSongs(
          start: (start == null) ? 0 : start,
          lang: sharedPreferenceService.getContentLang,
          query: query.string,
          songType: songType.string,
          sort: sort.string,
          artistIds: artists.map((e) => e.id.toString()).toList(),
          tagIds: tags.map((e) => e.id.toString()).toList())
      .catchError(super.onError);
}
