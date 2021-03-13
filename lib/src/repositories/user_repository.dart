import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/services.dart';
import 'package:vocadb_app/src/repositories/base_repository.dart';

class UserRepository extends RestApiRepository {
  UserRepository({HttpService httpService}) : super(httpService: httpService);

  /// Get a list of songs rated by user.
  Future<List<RatedSongModel>> getRatedSongs(int userId,
      {String lang = 'Default',
      String query,
      String rating,
      String sort,
      String artistIds,
      String tagIds,
      bool groupByRating = false,
      String nameMatchMode = 'Auto',
      int start = 0,
      int maxResults = 50}) async {
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
    params['lang'] = lang;
    params['start'] = start.toString();
    params['maxResults'] = maxResults.toString();
    return super
        .getList(endpoint, params)
        .then((items) => RatedSongModel.jsonToList(items));
  }

  /// Gets a list of artists followed by a user
  Future<List<FollowedArtistModel>> getFollowedArtists(int userId,
      {String lang = 'Default',
      String query,
      String artistType,
      String tagIds,
      String nameMatchMode = 'Auto',
      int start = 0,
      int maxResults = 50}) async {
    final String endpoint = '/api/users/$userId/followedArtists';
    final Map<String, String> params = Map();
    params['query'] = query;
    params['artistType'] = artistType;
    params['fields'] = 'MainPicture';
    params['lang'] = lang;
    params['tagId'] = tagIds;
    params['start'] = start.toString();
    params['maxResults'] = maxResults.toString();
    params['nameMatchMode'] = nameMatchMode;
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
      String tagIds,
      String nameMatchMode = 'Auto',
      int start = 0,
      int maxResults = 50}) async {
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
    params['start'] = start.toString();
    params['maxResults'] = maxResults.toString();
    params['nameMatchMode'] = nameMatchMode;
    return super
        .getList(endpoint, params)
        .then((items) => AlbumUserModel.jsonToList(items));
  }

  /// Gets currently logged in user's rating for a song
  Future<String> getCurrentUserRatedSong(int songId) {
    return httpService
        .get('/api/users/current/ratedSongs/$songId', null)
        .then((v) => v as String);
  }

  /// Gets currently logged in user's rating for a artist
  Future<ArtistModel> getCurrentUserFollowedArtist(int artistId) {
    return httpService
        .get('/api/users/current/followedArtists/$artistId', null)
        .then((v) => (v == null || v['artist'] == null)
            ? null
            : ArtistModel.fromJson(v['artist']));
  }

  /// Gets currently logged in user's album collection status
  Future<AlbumCollectionStatusModel> getCurrentUserAlbumCollection(
      int albumId) {
    return httpService
        .get('/api/users/current/album-collection-statuses/$albumId', null)
        .then((v) => (v == null || v['album'] == null)
            ? null
            : AlbumCollectionStatusModel.fromJson(v));
  }

  /// Update currently logged user's album collection status
  Future<String> updateCurrentUserAlbumCollectionStatus(int albumId,
      {String collectionStatus, String mediaType, int rating}) {
    int collectionStatusId = 0;
    switch (collectionStatus) {
      case 'Wishlisted':
        collectionStatusId = 1;
        break;
      case 'Ordered':
        collectionStatusId = 2;
        break;
      case 'Owned':
        collectionStatusId = 4;
        break;
    }

    int mediaTypeId = 0;
    switch (mediaType) {
      case 'PhysicalDisc':
        mediaTypeId = 1;
        break;
      case 'DigitalDownload':
        mediaTypeId = 2;
        break;
      case 'Other':
        mediaTypeId = 4;
        break;
    }

    return httpService.post('/api/users/current/albums/$albumId', {
      'collectionStatus': collectionStatusId,
      'mediaType': mediaTypeId,
      'rating': rating
    }).then((res) {
      return res;
    });
  }
}
