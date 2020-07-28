import 'package:meta/meta.dart';
import 'package:vocadb/models/models.dart';
import 'package:vocadb/repositories/repositories.dart';

class SongRepository {
  final String endpoint = '/api/songs';
  final VocaDBApiClient apiClient;

  SongRepository({@required this.apiClient}) : assert(apiClient != null);

  Future<List<SongModel>> highlighted({String lang = 'Default'}) async {
    return await apiClient.get('$endpoint/highlighted', <String, String>{
      'lang': lang,
      'fields': 'MainPicture,PVs,ThumbUrl',
    }).then((items) => SongModel.jsonToList(items));
  }

  Future<List<SongModel>> findAll(
      {String query, int start, String lang = 'Default'}) async {
    return await apiClient
        .get(endpoint, <String, String>{
          'query': query,
          'start': start?.toString(),
          'fields': 'MainPicture,PVs,ThumbUrl',
          'maxResults': '50',
          'lang': lang
        })
        .then((response) => response['items'])
        .then((items) => SongModel.jsonToList(items));
  }

  Future<SongModel> findById(int id, {String lang = 'Default'}) async {
    return await apiClient.get('$endpoint/$id', <String, String>{
      'fields':
          'MainPicture,PVs,ThumbUrl,Albums,Artists,Tags,WebLinks,AdditionalNames,WebLinks,Lyrics',
      'lang': lang
    }).then((item) => SongModel.fromJson(item));
  }
}
