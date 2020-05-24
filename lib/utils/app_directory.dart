import 'dart:io';

import 'package:meta/meta.dart';

class AppDirectory {
  final Directory applicationDocument;

  final Directory cookiesDirectory;

  AppDirectory({@required this.applicationDocument})
      : this.cookiesDirectory =
            Directory(applicationDocument.path + '/.cookies');

  void clearCookies() {
    print('clear cookies');
    this.cookiesDirectory.deleteSync(recursive: true);
  }
}
