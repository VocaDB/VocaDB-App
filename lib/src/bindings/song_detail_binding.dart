import 'package:get/get.dart';
import 'package:vocadb_app/controllers.dart';
import 'package:vocadb_app/repositories.dart';
import 'package:vocadb_app/services.dart';

class SongDetailBinding implements Bindings {
  @override
  void dependencies() {
    final httpService = Get.find<HttpService>();
    Get.lazyPut<SongDetailController>(() => SongDetailController(
        songRepository: SongRepository(httpService: httpService)));
  }
}
