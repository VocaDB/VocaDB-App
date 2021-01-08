import 'dart:io';

import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:path_provider/path_provider.dart';

class AppDirectory extends GetxService {
  Directory applicationDocument;

  Directory cookiesDirectory;

  AppDirectory();

  Future<AppDirectory> init() async {
    this.applicationDocument = await getApplicationDocumentsDirectory();
    this.cookiesDirectory = Directory(applicationDocument.path + '/.cookies');
    print('app cookies dir : ${applicationDocument.path}/.cookies');
    return this;
  }

  void clearCookies() {
    if (this.cookiesDirectory.existsSync()) {
      print('clear cookies');
      this.cookiesDirectory.deleteSync(recursive: true);

      if (this.cookiesDirectory.existsSync()) {
        print('cookies not clear!!!!!');
      } else {
        print('cookies cleared!');
      }
    } else {
      print('cookies does not exists for clear');
    }
  }
}
