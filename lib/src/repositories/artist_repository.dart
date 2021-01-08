import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/services.dart';
import 'package:vocadb_app/src/repositories/base_repository.dart';

class ArtistRepository extends RestApiRepository {
  ArtistRepository({HttpService httpService}) : super(httpService: httpService);

  /// Find artists
  Future<List<ArtistModel>> findArtists(
      {String lang = 'Default',
      String query,
      String artistType,
      String sort,
      String tagIds}) async {
    final String endpoint = '/api/artists';
    final Map<String, String> params = Map();
    params['query'] = query;
    params['artistTypes'] = artistType;
    params['fields'] = 'MainPicture';
    params['languagePreference'] = lang;
    params['tagId'] = tagIds;
    params['sort'] = sort;
    return super
        .getList(endpoint, params)
        .then((items) => ArtistModel.jsonToList(items));
  }

  /// Gets a artist by Id.
  Future<ArtistModel> getById(int id, {String lang = 'Default'}) {
    final Map<String, String> params = {
      'fields':
          'Tags,MainPicture,WebLinks,BaseVoicebank,Description,ArtistLinks,ArtistLinksReverse,AdditionalNames',
      'relations': 'All',
      'lang': lang,
    };
    return super
        .getObject('/api/artists/$id', params)
        .then((i) => ArtistModel.fromJson(i));
  }

  Future<List<ArtistModel>> getTopArtistsByTagId(int tagId,
      {String lang = 'Default'}) async {
    return this
        .findArtists(lang: lang, tagIds: tagId.toString(), sort: 'RatingScore');
  }
}
