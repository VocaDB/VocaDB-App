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

  /// Gets a list of artists followed by a user
  Future<List<FollowedArtistModel>> getFollowedArtists(int userId,
      {String lang = 'Default', String artistType, String tagIds}) async {
    final String endpoint = '/api/users/$userId/followedArtists';
    final Map<String, String> params = Map();
    params['artistType'] = artistType;
    params['fields'] = 'MainPicture';
    params['lang'] = lang;
    params['tagId'] = tagIds;
    return super
        .getList(endpoint, params)
        .then((items) => FollowedArtistModel.jsonToList(items));
  }

  /// Gets a list of albums in a user's collection.
  Future<List<AlbumUserModel>> getAlbums(int userId,
      {String lang = 'Default',
      String query,
      String discType,
      String sort,
      String purchaseStatuses,
      String artistIds,
      String tagIds}) async {
    final String endpoint = '/api/users/$userId/albums';
    final Map<String, String> params = Map();
    params['query'] = query;
    params['albumTypes'] = discType;
    params['purchaseStatuses'] = purchaseStatuses;
    params['fields'] = 'MainPicture';
    params['lang'] = lang;
    params['tagId'] = tagIds;
    params['artistId'] = artistIds;
    params['sort'] = sort;
    return super
        .getList(endpoint, params)
        .then((items) => AlbumUserModel.jsonToList(items));
  }
}
