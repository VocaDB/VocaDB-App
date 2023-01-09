abstract class UserRepository {
  Future<String> fetchRatedSongID(int userID, int songID);
}
