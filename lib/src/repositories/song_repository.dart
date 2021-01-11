import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/services.dart';
import 'package:vocadb_app/src/repositories/base_repository.dart';

class SongRepository extends RestApiRepository {
  SongRepository({HttpService httpService}) : super(httpService: httpService);

  /// Find songs.
  Future<List<SongModel>> findSongs(
      {String lang = 'Default',
      String query,
      String songType,
      String sort,
      String artistIds,
      String tagIds,
      int start = 0,
      int maxResults = 50,
      String nameMatchMode = 'Auto'}) async {
    final String endpoint = '/api/songs';
    final Map<String, String> params = Map();
    params['query'] = query;
    params['fields'] = 'ThumbUrl,PVs,MainPicture';
    params['songType'] = songType;
    params['sort'] = sort;
    params['artistId'] = artistIds;
    params['tagId'] = tagIds;
    params['languagePreference'] = lang;
    params['maxResults'] = maxResults.toString();
    params['start'] = start.toString();
    params['nameMatchMode'] = nameMatchMode;
    return super
        .getList(endpoint, params)
        .then((items) => SongModel.jsonToList(items));
  }

  /// Gets list of highlighted songs, same as front page.
  Future<List<SongModel>> getHighlighted({String lang = 'Default'}) async {
    final String endpoint = '/api/songs/highlighted';
    final Map<String, String> params = Map();
    params['fields'] = 'ThumbUrl,PVs';
    params['languagePreference'] = lang;
    return super
        .getList(endpoint, params)
        .then((items) => SongModel.jsonToList(items));
  }

  /// Gets top rated songs.
  Future<List<SongModel>> getTopRated(
      {String lang = 'Default',
      int durationHours,
      String filterBy,
      String vocalist}) async {
    final String endpoint = '/api/songs/top-rated';
    final Map<String, String> params = Map();
    params['durationHours'] = durationHours.toString();
    params['fields'] = 'ThumbUrl,PVs';
    params['filterBy'] = filterBy;
    params['vocalist'] = vocalist;
    params['languagePreference'] = lang;
    return super
        .getList(endpoint, params)
        .then((items) => SongModel.jsonToList(items));
  }

  /// Gets top rated daily songs.
  Future<List<SongModel>> getTopRatedDaily(
      {String lang = 'Default', String filterBy, String vocalist}) async {
    return this.getTopRated(
        lang: lang, durationHours: 24, filterBy: filterBy, vocalist: vocalist);
  }

  /// Gets top rated weekly songs.
  Future<List<SongModel>> getTopRatedWeekly(
      {String lang = 'Default', String filterBy, String vocalist}) async {
    return this.getTopRated(
        lang: lang, durationHours: 168, filterBy: filterBy, vocalist: vocalist);
  }

  /// Gets top rated monthly songs.
  Future<List<SongModel>> getTopRatedMonthly(
      {String lang = 'Default', String filterBy, String vocalist}) async {
    return this.getTopRated(
        lang: lang, durationHours: 720, filterBy: filterBy, vocalist: vocalist);
  }

  /// Gets a song by Id.
  Future<SongModel> getById(int id, {String lang = 'Default'}) {
    final Map<String, String> params = {
      'fields':
          'MainPicture,PVs,ThumbUrl,Albums,Artists,Tags,WebLinks,AdditionalNames,WebLinks,Lyrics',
      'lang': lang,
    };
    return super
        .getObject('/api/songs/$id', params)
        .then((i) => SongModel.fromJson(i));
  }

  Future<List<SongModel>> getDerived(int id, {String lang = 'Default'}) async {
    final String endpoint = '/api/songs/$id/derived';
    final Map<String, String> params = Map();
    params['fields'] = 'ThumbUrl,PVs';
    params['lang'] = lang;
    return super
        .getList(endpoint, params)
        .then((items) => SongModel.jsonToList(items));
  }

  Future<List<SongModel>> getRelated(int id, {String lang = 'Default'}) async {
    final String endpoint = '/api/songs/$id/related';
    final Map<String, String> params = Map();
    params['fields'] = 'ThumbUrl,PVs';
    params['lang'] = lang;
    return super
        .getList(endpoint, params)
        .then((related) => SongModel.jsonToList(related['likeMatches']));
  }

  Future<List<SongModel>> getLatestSongsByTagId(int tagId,
      {String lang = 'Default'}) async {
    return this
        .findSongs(lang: lang, tagIds: tagId.toString(), sort: 'AdditionDate');
  }

  Future<List<SongModel>> getTopSongsByTagId(int tagId,
      {String lang = 'Default'}) async {
    return this
        .findSongs(lang: lang, tagIds: tagId.toString(), sort: 'RatingScore');
  }

  Future<dynamic> rating(int songId, String rating) {
    return httpService.post('/api/songs/$songId/ratings', {'rating': rating});
  }
}
