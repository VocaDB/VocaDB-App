import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/services.dart';
import 'package:vocadb_app/src/repositories/base_repository.dart';

class ReleaseEventRepository extends RestApiRepository {
  ReleaseEventRepository({HttpService httpService})
      : super(httpService: httpService);

  Future<List<ReleaseEventModel>> findReleaseEvents(
      {String lang = 'Default',
      String query,
      String sort,
      String category,
      String afterDate,
      String beforeDate,
      String artistIds,
      String tagIds}) async {
    final String endpoint = '/api/releaseEvents';
    final Map<String, String> params = Map();
    params['fields'] = ' MainPicture,Series';
    params['languagePreference'] = lang;
    params['query'] = query;
    params['sort'] = sort;
    params['category'] = category;
    params['tagId'] = tagIds;
    params['artistId'] = artistIds;
    params['afterDate'] = afterDate;
    params['beforeDate'] = beforeDate;
    return super
        .getList(endpoint, params)
        .then((items) => ReleaseEventModel.jsonToList(items));
  }

  /// Gets list of top rated albums, same as front page.
  Future<List<ReleaseEventModel>> getRecently({String lang = 'Default'}) async {
    return this.findReleaseEvents(
        lang: lang,
        sort: 'Date',
        afterDate: DateTime.now().subtract(Duration(days: 3)).toString(),
        beforeDate: DateTime.now().add(Duration(days: 12)).toString());
  }
}
