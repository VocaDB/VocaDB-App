import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vocadb_app/config.dart';
import 'package:vocadb_app/controllers.dart';
import 'package:vocadb_app/src/config/app_translations.dart';

class SharedPreferenceService extends GetxService {
  static final String container = 'pref';

  final GetStorage box;

  final uiLang = ReadWriteValue('uiLang', 'en_US');

  final contentLang = 'Default'.obs;

  SharedPreferenceService({this.box});

  static get lang => Get.find<SharedPreferenceService>().contentLang.string;

  void init() {
    initUILang();
    initContentLang();
  }

  void initUILang() {
    uiLang.val = box.read('uiLang');
    AppTranslation().changeLocale(uiLang.val);
    print('current locale $Get.locale');
  }

  updateUiLang(String value) {
    box.write('uiLang', value);
    uiLang.val = value;
    AppTranslation().changeLocale(value);
    print('current locale $Get.locale');
  }

  void initContentLang() {
    contentLang(box.read('contentLang'));
  }

  updateContentLang(String value) {
    print('before update content lang : ${contentLang.val}');
    box.write('contentLang', value);
    contentLang(value);
    print('after update content lang : ${contentLang.val}');
    Get.find<HomePageController>().fetchApi();
    Get.find<RankingController>().fetchApi();
  }
}
