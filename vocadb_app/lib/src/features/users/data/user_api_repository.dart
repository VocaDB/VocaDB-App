import 'package:vocadb_app/src/features/api/api_client.dart';
import 'package:vocadb_app/src/features/users/data/user_repository.dart';

class UserApiRepository implements UserRepository {
  UserApiRepository({required this.client});

  final ApiClient client;

  @override
  Future<String> fetchRatedSongID(int userID, int songID) async {
    final response =
        await client.get('/api/users/$userID/ratedSongs/$songID', json: false);

    return response;
  }
}
