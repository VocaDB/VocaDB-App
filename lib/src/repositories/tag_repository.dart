import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/services.dart';
import 'package:vocadb_app/src/repositories/base_repository.dart';

class TagRepository extends RestApiRepository {
  TagRepository({HttpService httpService}) : super(httpService: httpService);

  /// Find tags
  Future<List<TagModel>> findTags(
      {String lang = 'Default',
      String query,
      String categoryName,
      int start = 0,
      int maxResults = 50,
      String nameMatchMode = 'Auto'}) async {
    final String endpoint = '/api/tags';
    final Map<String, String> params = Map();
    params['query'] = query;
    params['fields'] = 'MainPicture';
    params['categoryName'] = categoryName;
    params['lang'] = lang;
    params['start'] = start.toString();
    params['maxResults'] = maxResults.toString();
    params['nameMatchMode'] = nameMatchMode;
    return super
        .getList(endpoint, params)
        .then((items) => TagModel.jsonToList(items));
  }

  /// Gets a tag by Id.
  Future<TagModel> getById(int id, {String lang = 'Default'}) {
    final Map<String, String> params = Map();
    params['fields'] =
        'MainPicture,AdditionalNames,Description,Parent,RelatedTags,WebLinks';
    params['lang'] = lang;
    return super
        .getObject('/api/tags/$id', params)
        .then((i) => TagModel.fromJson(i));
  }
}
