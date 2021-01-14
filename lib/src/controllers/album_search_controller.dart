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

  AlbumSearchController({this.albumRepository});

  @override
  void onInit() {
    [discType, sort, artists, tags]
        .forEach((element) => ever(element, (_) => initialFetch()));
    super.onInit();
  }

  Future<List<AlbumModel>> fetchApi({int start}) => albumRepository
      .findAlbums(
        start: (start == null) ? 0 : start,
        lang: SharedPreferenceService.lang,
        maxResults: maxResults,
        query: query.string,
        discType: discType.string,
        sort: sort.string,
        artistIds: artists.toList().map((e) => e.id).join(','),
        tagIds: tags.toList().map((e) => e.id).join(','),
      )
      .catchError(super.onError);
}
