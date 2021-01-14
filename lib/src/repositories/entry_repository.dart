import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/services.dart';
import 'package:vocadb_app/src/repositories/base_repository.dart';

class EntryRepository extends RestApiRepository {
  EntryRepository({HttpService httpService}) : super(httpService: httpService);

  /// Find entries
  Future<List<EntryModel>> findEntries(
      {String lang = 'Default',
      String query,
      String entryType,
      String sort,
      String tagIds,
      String nameMatchMode = 'Auto'}) async {
    final String endpoint = '/api/entries';
    final Map<String, String> params = Map();
    params['query'] = query;
    params['entryTypes'] = entryType;
    params['fields'] = 'MainPicture';
    params['languagePreference'] = lang;
    params['tagId'] = tagIds;
    params['sort'] = sort;
    params['nameMatchMode'] = nameMatchMode;
    return super
        .getList(endpoint, params)
        .then((items) => EntryModel.jsonToList(items));
  }
}
