import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/common_widgets/async_value_widget.dart';
import 'package:vocadb_app/src/features/home/presentation/app_bar/global_app_bar.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/song_detail_screen_controller.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/widgets/song_detail_content.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/widgets/song_detail_lyrics_content.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/widgets/song_detail_pv_player.dart';

class SongDetailScreen extends ConsumerStatefulWidget {
  const SongDetailScreen({super.key, required this.song});
  final Song song;

  /// Keys for test
  static const tagsKey = Key('tags-key');
  static const artistsKey = Key('artists-key');
  static const pvsKey = Key('pvs-key');
  static const albumsKey = Key('albums-key');
  static const releaseEventsKey = Key('release-event-key');
  static const webLinksKey = Key('web-links-key');
  static const songDetailScrollKey = Key('song-detail-scroll-key');

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SongDetailScreenState();
}

class _SongDetailScreenState extends ConsumerState<SongDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(songDetailScreenControllerProvider(widget.song.id));
    
    return AsyncValueWidget(
      value: state.song,
      data: (song) => SafeArea(child: Scaffold(
        appBar: const GlobalAppBar(title: Text('Song Detail')),
        body: 
      (song.hasYoutubePV)? SongDetailPVPlayer(song: song) : const Text('No PV!!'),
      ),),
    );
  }
}
