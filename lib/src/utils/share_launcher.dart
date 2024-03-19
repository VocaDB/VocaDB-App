import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';
import 'package:vocadb_app/flavor_config.dart';

class ShareLauncher {

  final String host;

  ShareLauncher(this.host);

  shareSong(int id) => 
    Share.share('$host/S/$id');
  
  shareArtist(int id) =>
    Share.share('$host/Ar/$id');

  shareAlbum(int id) =>
    Share.share('$host/Al/$id');
  
  shareTag(int id) =>
    Share.share('$host/T/$id');

  shareReleaseEvent(int id) =>
    Share.share('$host/E/$id');
}

final shareLauncherProvider = Provider<ShareLauncher>((ref) {
  final flavorConfig = ref.watch(flavorConfigProvider);
  return ShareLauncher('https://${flavorConfig.apiAuthority}');
});