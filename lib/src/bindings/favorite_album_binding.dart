import 'package:get/get.dart';
import 'package:vocadb_app/controllers.dart';
import 'package:vocadb_app/repositories.dart';
import 'package:vocadb_app/services.dart';

class FavoriteAlbumBinding implements Bindings {
  @override
  void dependencies() {
    final httpService = Get.find<HttpService>();
    final authService = Get.find<AuthService>();
    Get.lazyPut<FavoriteAlbumController>(() => FavoriteAlbumController(
        userRepository: UserRepository(httpService: httpService),
        authService: authService));
  }
}
