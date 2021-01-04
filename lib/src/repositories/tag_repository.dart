import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/services.dart';
import 'package:vocadb_app/src/repositories/base_repository.dart';

class TagRepository extends RestApiRepository {
  TagRepository({HttpService httpService}) : super(httpService: httpService);

  /// Find tags
  Future<List<TagModel>> findTags(
      {String lang = 'Default', String query, String categoryName}) async {
    final String endpoint = '/api/tags';
    final Map<String, String> params = Map();
    params['query'] = query;
    params['fields'] = 'MainPicture';
    params['categoryName'] = categoryName;
    params['languagePreference'] = lang;
    return super
        .getList(endpoint, params)
        .then((items) => TagModel.jsonToList(items));
  }
}
