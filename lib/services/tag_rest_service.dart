import 'dart:async';

import 'package:vocadb/models/tag_model.dart';
import 'package:vocadb/services/base_rest_service.dart';
import 'package:vocadb/services/web_service.dart';

class TagRestService extends BaseRestService {
  TagRestService({RestApi restApi}) : super(restApi: restApi);

  Future<List<TagModel>> list({Map<String, String> params}) async {
    final String endpoint = '/api/tags';

    params ??= {};

    return super
        .query(endpoint, params)
        .then((items) => TagModel.jsonToList(items));
  }

  Future<List<TagModel>> search(String query, {String lang = 'Default'}) async {
    final Map<String, String> params = {
      'lang': lang,
      'nameMatchMode': 'Auto',
      'maxResults': '30',
    };

    if (query != null && query.isNotEmpty) {
      params['query'] = query;
    }

    return this.list(params: params);
  }

  Future<TagModel> byId(int id, {String lang = 'Default'}) {
    final Map<String, String> params = {
      'fields':
          'MainPicture,AdditionalNames,Description,Parent,RelatedTags,WebLinks',
      'lang': lang,
    };

    return super
        .getObject('/api/tags/$id', params)
        .then((i) => TagModel.fromJson(i));
  }
}
