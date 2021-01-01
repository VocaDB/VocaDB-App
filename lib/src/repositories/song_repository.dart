import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/services.dart';
import 'package:vocadb_app/src/repositories/base_repository.dart';

class SongRepository extends RestApiRepository {
  SongRepository({HttpService httpService}) : super(httpService: httpService);

  Future<List<SongModel>> getHighlighted({String lang = 'Default'}) async {
    final String endpoint = '/api/songs/highlighted';
    final Map<String, String> params = {'fields': 'ThumbUrl,PVs'};
    params['languagePreference'] = lang;
    return super
        .getList(endpoint, params)
        .then((items) => SongModel.jsonToList(items));
  }
}
