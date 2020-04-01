import 'dart:async';

import 'package:vocadb/models/album_model.dart';
import 'package:vocadb/models/user_model.dart';
import 'package:vocadb/services/base_rest_service.dart';
import 'package:vocadb/services/web_service.dart';

class UserRestService extends BaseRestService {
  UserRestService({RestApi restApi}) : super(restApi: restApi);

  Future<UserModel> getCurrent() {
    final Map<String, String> params = {
      'fields': 'MainPicture',
    };

    return super
        .getObject('/api/users/current', params)
        .then((i) => UserModel.fromJson(i));
  }

  Future<List<AlbumModel>> albums(int id, {String lang = 'Default'}) {
    final String endpoint = '/api/users/$id/albums';
    final Map<String, String> params = {'fields': 'MainPicture'};
    params['lang'] = lang;

    return super
        .query(endpoint, params)
        .then((items) => AlbumModel.jsonToList(items));
  }
}
