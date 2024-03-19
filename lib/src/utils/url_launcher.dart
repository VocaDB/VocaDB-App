import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:vocadb_app/flavor_config.dart';

class UrlLauncher {
  
  final String host;

  UrlLauncher(this.host);

  launchSongMoreInfo(int id) => 
    launchUrlString('$host/S/$id');
  
  launchArtistMoreInfo(int id) =>
    launchUrlString('$host/Ar/$id');

  launchAlbumMoreInfo(int id) =>
    launchUrlString('$host/Al/$id');
  
  launchTagMoreInfo(int id) =>
    launchUrlString('$host/T/$id');
}


final urlLauncherProvider = Provider<UrlLauncher>((ref) {
  final flavorConfig = ref.watch(flavorConfigProvider);
  return UrlLauncher('https://${flavorConfig.apiAuthority}');
});