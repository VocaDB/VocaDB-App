import 'package:meta/meta.dart';
import 'package:vocadb/models/models.dart';
import 'package:vocadb/parameters/parameters.dart';
import 'package:vocadb/repositories/repositories.dart';

class SongRepository {
  final String endpoint = '/api/songs';
  final VocaDBApiClient apiClient;

  SongRepository({@required this.apiClient}) : assert(apiClient != null);

  Future<List<SongModel>> highlighted({SongParameter parameter}) async {
    return await apiClient
        .get('$endpoint/highlighted', parameter?.toMap())
        .then((items) => SongModel.jsonToList(items));
  }

  Future<List<SongModel>> findAll({SongParameter parameter}) async {
    return await apiClient
        .get(endpoint, parameter?.toMap())
        .then((response) => response['items'])
        .then((items) => SongModel.jsonToList(items));
  }

  Future<SongModel> findById(int id, {SongParameter parameter}) async {
    return await apiClient
        .get('$endpoint/$id', parameter?.toMap())
        .then((item) => SongModel.fromJson(item));
  }
}
