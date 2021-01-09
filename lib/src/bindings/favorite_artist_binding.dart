import 'package:get/get.dart';
import 'package:vocadb_app/controllers.dart';
import 'package:vocadb_app/repositories.dart';
import 'package:vocadb_app/services.dart';

class FavoriteArtistBinding implements Bindings {
  @override
  void dependencies() {
    final httpService = Get.find<HttpService>();
    final authService = Get.find<AuthService>();
    Get.lazyPut<FavoriteArtistController>(() => FavoriteArtistController(
        userRepository: UserRepository(httpService: httpService),
        authService: authService));
  }
}
