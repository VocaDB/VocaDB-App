import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/services.dart';
import 'package:vocadb_app/src/repositories/base_repository.dart';

class UserRepository extends RestApiRepository {
  final AuthService authService;

  UserRepository({HttpService httpService, this.authService})
      : super(httpService: httpService);

  /// Get a list of songs rated by user.
  Future<List<RatedSongModel>> getRatedSongs(int userId,
      {String lang = 'Default',
      String query,
      String rating,
      String sort,
      String artistIds,
      String tagIds,
      bool groupByRating = false,
      String nameMatchMode = 'Auto'}) async {
    final String endpoint = '/api/users/$userId/ratedSongs';
    final Map<String, String> params = Map();
    params['query'] = query;
    params['fields'] = 'ThumbUrl,PVs,MainPicture';
    params['sort'] = sort;
    params['rating'] = rating;
    params['groupByRating'] = groupByRating.toString();
    params['artistId'] = artistIds;
    params['tagId'] = tagIds;
    params['nameMatchMode'] = nameMatchMode;
    params['languagePreference'] = lang;
    return super
        .getList(endpoint, params)
        .then((items) => RatedSongModel.jsonToList(items));
  }
}
