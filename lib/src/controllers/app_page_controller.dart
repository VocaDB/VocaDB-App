import 'package:get/get.dart';
import 'package:vocadb_app/utils.dart';

class AppPageController extends GetxController {
  final initialLoading = true.obs;

  final errorMessage = ''.obs;

  void initialLoadingDone(_) => initialLoading(false);

  void onError(Object err) {
    print(err);
    initialLoading(false);
    errorMessage(ErrorUtils.read(err));
  }
}
