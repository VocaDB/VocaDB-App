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

  ArtistSearchController({this.artistRepository});

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
        lang: SharedPreferenceService.lang,
        maxResults: maxResults,
        query: query.string,
        artistType: artistType.string,
        sort: sort.string,
        tagIds: tags.toList().map((e) => e.id).join(','),
      )
      .catchError(super.onError);
}
