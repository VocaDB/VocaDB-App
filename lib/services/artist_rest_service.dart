import 'dart:async';

import 'package:vocadb/models/artist_model.dart';
import 'package:vocadb/services/base_rest_service.dart';
import 'package:vocadb/services/web_service.dart';

class ArtistRestService extends BaseRestService {
  ArtistRestService({RestApi restApi}) : super(restApi: restApi);

  Future<List<ArtistModel>> search(String query,
      {String lang = 'Default'}) async {
    final String endpoint = '/api/artists';
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
        .then((items) => ArtistModel.jsonToList(items));
  }

    Future<ArtistModel> byId(int id, {String lang = 'Default'}) {
    final Map<String, String> params = {
      'fields': 'Tags,MainPicture,WebLinks,BaseVoicebank,Description,ArtistLinks,ArtistLinksReverse,AdditionalNames',
      'relations': 'All',
      'lang': lang,
    };

    return super
        .getObject('/api/artists/$id', params)
        .then((i) => ArtistModel.fromJson(i));
  }
}
