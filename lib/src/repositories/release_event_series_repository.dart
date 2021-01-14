import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/services.dart';
import 'package:vocadb_app/src/repositories/base_repository.dart';

class ReleaseEventSeriesRepository extends RestApiRepository {
  ReleaseEventSeriesRepository({HttpService httpService})
      : super(httpService: httpService);

  /// Gets an event series by Id.
  Future<ReleaseEventSeriesModel> getById(int id, {String lang = 'Default'}) {
    final Map<String, String> params = {
      'fields': 'AdditionalNames,Description,Events,MainPicture,WebLinks,Tags',
      'lang': lang,
    };
    return super
        .getObject('/api/releaseEventSeries/$id', params)
        .then((i) => ReleaseEventSeriesModel.fromJson(i));
  }
}
