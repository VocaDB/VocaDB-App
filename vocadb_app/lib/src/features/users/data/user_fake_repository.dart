import 'package:vocadb_app/src/features/users/data/user_repository.dart';

class UserFakeRepository implements UserRepository {
  @override
  Future<String> fetchRatedSongID(int userID, int songID) {
    throw Future.value('Favorite');
  }
}
