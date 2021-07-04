import 'package:get/get.dart';
import 'package:vocadb_app/controllers.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/repositories.dart';
import 'package:vocadb_app/services.dart';

class ArtistSearchController extends SearchPageController<ArtistModel> {
  /// Filter parameter
  final artistType = ''.obs;

  final sort = 'Name'.obs;

  final tags = <TagModel>[].obs;

  final ArtistRepository artistRepository;

  final SharedPreferenceService sharedPreferenceService;

  ArtistSearchController(
      {this.artistRepository, SharedPreferenceService sharedPreferenceService})
      : sharedPreferenceService =
            sharedPreferenceService ?? Get.find<SharedPreferenceService>();

  @override
  void onInit() {
    [artistType, sort, tags]
        .forEach((element) => ever(element, (_) => initialFetch()));
    super.onInit();
  }

  @override
  Future<List<ArtistModel>> fetchApi({int start}) => artistRepository
      .findArtists(
        start: (start == null) ? 0 : start,
        lang: sharedPreferenceService.getContentLang,
        maxResults: maxResults,
        query: query.string,
        artistType: artistType.string,
        sort: sort.string,
        tagIds: tags.map((e) => e.id.toString()).toList(),
      )
      .catchError(super.onError);
}
