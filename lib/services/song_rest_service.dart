import 'package:vocadb/models/song_model.dart';
import 'package:vocadb/services/base_rest_service.dart';
import 'package:vocadb/services/web_service.dart';

class SongRestService extends BaseRestService<SongModel> {

  final String endpoint = '/api/songs';

  SongRestService(RestService restService) : super(restService);

  @override
  SongModel mapModel(Map json) {
    return SongModel.fromJson(json);
  }
}