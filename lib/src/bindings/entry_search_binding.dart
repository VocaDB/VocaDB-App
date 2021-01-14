import 'package:get/get.dart';
import 'package:vocadb_app/controllers.dart';
import 'package:vocadb_app/repositories.dart';
import 'package:vocadb_app/services.dart';

class EntrySearchBinding implements Bindings {
  @override
  void dependencies() {
    final httpService = Get.find<HttpService>();
    Get.lazyPut<EntrySearchController>(() => EntrySearchController(
        entryRepository: EntryRepository(httpService: httpService)));
  }
}
