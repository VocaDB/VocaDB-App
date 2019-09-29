import 'dart:async';

import 'package:vocadb/models/tag_model.dart';
import 'package:vocadb/services/base_rest_service.dart';
import 'package:vocadb/services/web_service.dart';

class TagRestService extends BaseRestService {
  TagRestService({RestApi restApi}) : super(restApi: restApi);

  Future<List<TagModel>> search(String query, {String lang = 'Default'}) async {
    final String endpoint = '/api/tags';
    final Map<String, String> params = {
      'lang': lang,
      'nameMatchMode': 'Auto',
      'maxResults': '30',
    };

    if (query != null && query.isNotEmpty) {
      params['query'] = query;
    }

    return super
        .query(endpoint, params)
        .then((items) => TagModel.jsonToList(items));
  }
}
