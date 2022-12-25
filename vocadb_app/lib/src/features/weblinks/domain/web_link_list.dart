import 'package:vocadb_app/src/features/weblinks/domain/web_link.dart';

class WebLinkList {
  final List<WebLink> webLinks;

  WebLinkList(this.webLinks);

  List<WebLink> get officialLinks =>
      webLinks.where((link) => link.category != 'Reference').toList()
        ..sort((a, b) => a.description.compareTo(b.description));

  List<WebLink> get unofficialLinks =>
      webLinks.where((link) => link.category == 'Reference').toList()
        ..sort((a, b) => a.description.compareTo(b.description));
}
