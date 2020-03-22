import 'dart:async';

import 'package:vocadb/models/release_event_series_model.dart';
import 'package:vocadb/services/base_rest_service.dart';
import 'package:vocadb/services/web_service.dart';

class ReleaseEventSeriesRestService extends BaseRestService {
  ReleaseEventSeriesRestService({RestApi restApi}) : super(restApi: restApi);

  Future<ReleaseEventSeriesModel> byId(int id, {String lang = 'Default'}) {
    final Map<String, String> params = {
      'fields':
          'AdditionalNames,Description,Events,MainPicture,WebLinks',
      'lang': lang,
    };

    return super
        .getObject('/api/releaseEventSeries/$id', params)
        .then((i) => ReleaseEventSeriesModel.fromJson(i));
  }
}
