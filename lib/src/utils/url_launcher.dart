import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:vocadb_app/flavor_config.dart';

class UrlLauncher {
  
  final String host;

  UrlLauncher(this.host);

  launchMoreInfo(String path) {
    launchUrlString('https://${host}${path}');
  }
}


final urlLauncherProvider = Provider<UrlLauncher>((ref) {
  final flavorConfig = ref.watch(flavorConfigProvider);
  return UrlLauncher(flavorConfig.apiAuthority);
});