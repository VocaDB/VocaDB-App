import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/services.dart';
import 'package:vocadb_app/src/repositories/base_repository.dart';

class AlbumRepository extends RestApiRepository {
  AlbumRepository({HttpService httpService}) : super(httpService: httpService);

  /// Find albums
  Future<List<AlbumModel>> findAlbums(
      {String lang = 'Default',
      String query,
      String discType,
      String sort,
      String artistIds,
      String tagIds}) async {
    final String endpoint = '/api/albums';
    final Map<String, String> params = Map();
    params['query'] = query;
    params['discTypes'] = discType;
    params['fields'] = 'MainPicture';
    params['languagePreference'] = lang;
    params['tagId'] = tagIds;
    params['artistId'] = artistIds;
    params['sort'] = sort;
    return super
        .getList(endpoint, params)
        .then((items) => AlbumModel.jsonToList(items));
  }

  /// Gets list of upcoming or recent albums, same as front page.
  Future<List<AlbumModel>> getNew({String lang = 'Default'}) async {
    final String endpoint = '/api/albums/new';
    final Map<String, String> params = Map();
    params['fields'] = 'MainPicture';
    params['languagePreference'] = lang;
    return super
        .getList(endpoint, params)
        .then((items) => AlbumModel.jsonToList(items));
  }

  /// Gets list of top rated albums, same as front page.
  Future<List<AlbumModel>> getTop({String lang = 'Default'}) async {
    final String endpoint = '/api/albums/top';
    final Map<String, String> params = Map();
    params['fields'] = 'MainPicture';
    params['languagePreference'] = lang;
    return super
        .getList(endpoint, params)
        .then((items) => AlbumModel.jsonToList(items));
  }
}
