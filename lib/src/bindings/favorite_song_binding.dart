import 'package:get/get.dart';
import 'package:vocadb_app/repositories.dart';
import 'package:vocadb_app/services.dart';
import 'package:vocadb_app/src/controllers/favorite_song_controller.dart';

class FavoriteSongBinding implements Bindings {
  @override
  void dependencies() {
    final httpService = Get.find<HttpService>();
    final authService = Get.find<AuthService>();
    Get.lazyPut<FavoriteSongController>(() => FavoriteSongController(
        userRepository: UserRepository(httpService: httpService),
        authService: authService));
  }
}
