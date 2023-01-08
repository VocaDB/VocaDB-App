import 'package:flutter/material.dart';
import 'package:vocadb_app/src/features/songs/domain/lyric.dart';

/// A widget for display group of lyrics content
class SongDetailLyricsContent extends StatefulWidget {
  final List<Lyric> lyrics;

  final GestureTapCallback? onTapClose;

  const SongDetailLyricsContent({this.onTapClose, required this.lyrics});

  @override
  State<SongDetailLyricsContent> createState() =>
      _SongDetailLyricsContentState();
}

class _SongDetailLyricsContentState extends State<SongDetailLyricsContent> {
  late Lyric selectedLyric;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedLyric = widget.lyrics[0];
  }

  void _changeTranslation(Lyric lyricModel) {
    setState(() {
      selectedLyric = lyricModel;
    });
  }

  String _translationLabel(Lyric lyricModel) {
    return 'label';
    // return lyricModel.translationType +
    //     ((lyricModel.cultureCode == null || lyricModel?.cultureCode.isEmpty)
    //         ? ''
    //         : ' (${lyricModel.cultureCode})');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: widget.onTapClose,
            child: Container(
              height: 36,
              alignment: Alignment.center,
              child: const Icon(Icons.close),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 8.0),
            child: SizedBox(
              height: 76,
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: widget.lyrics
                      .map((lyric) => Container(
                            margin: const EdgeInsets.only(right: 4.0),
                            child: InputChip(
                              backgroundColor: (lyric.translationType ==
                                      selectedLyric.translationType)
                                  ? Theme.of(context).chipTheme.selectedColor
                                  : Theme.of(context).chipTheme.backgroundColor,
                              onPressed: () => _changeTranslation(lyric),
                              label: Text(_translationLabel(lyric)),
                            ),
                          ))
                      .toList()),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
                padding:
                    const EdgeInsets.only(bottom: 16.0, right: 8.0, left: 8.0),
                child: Text(selectedLyric.value ?? '<None>')),
          ),
        ],
      ),
    );
  }
}
