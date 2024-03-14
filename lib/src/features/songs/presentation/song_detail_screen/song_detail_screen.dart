import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/common_widgets/async_value_widget.dart';
import 'package:vocadb_app/src/features/home/presentation/app_bar/global_app_bar.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/song_detail_screen_controller.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/widgets/song_detail_albums_section.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/widgets/song_detail_artists_section.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/widgets/song_detail_button_bar.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/widgets/song_detail_content.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/widgets/song_detail_derived_section.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/widgets/song_detail_info_section.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/widgets/song_detail_lyrics_content.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/widgets/song_detail_pv_player.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/widgets/song_detail_pvs_section.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/widgets/song_detail_related_section.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/widgets/song_detail_tags_section.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/widgets/song_detail_web_links_section.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/widgets/song_detail_with_pv.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/widgets/song_detail_without_pv.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/widgets/song_hero_image.dart';

class SongDetailScreen extends ConsumerStatefulWidget {
  const SongDetailScreen({super.key, required this.song, this.pvPlayerWidget});

  final Song song;

  final Widget? pvPlayerWidget;

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
  _toggleShowLyric() {
    ref
        .read(songDetailScreenControllerProvider(widget.song.id).notifier)
        .toggleLyricContent();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(songDetailScreenControllerProvider(widget.song.id));

    return AsyncValueWidget(
      value: state.song,
      data: (song) => SafeArea(
        child: Scaffold(
          appBar: GlobalAppBar(title: Text(song.name ?? 'Song detail')),
          body: Column(children: [
            // PV or thumbnail
            (song.hasYoutubePV)
                ? widget.pvPlayerWidget ?? SongDetailPVPlayer(song: song)
                : SongHeroImage(imageUrl: song.imageUrl!),
            
            // Lyrics or Song detail content
            (state.showLyricContent)
                ? LyricContent(
                    lyrics: song.lyrics,
                    onTapClose: _toggleShowLyric,
                  )
                : SongDetailContent(
                    song: song,
                    onTapLyricButton: _toggleShowLyric,
                  ),
          ]),
        ),
      ),
    );
  }
}
