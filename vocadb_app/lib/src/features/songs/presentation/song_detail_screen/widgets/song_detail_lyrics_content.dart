import 'package:flutter/material.dart';
import 'package:vocadb_app/src/features/songs/domain/lyric.dart';

/// A widget for display group of lyrics content
class LyricContent extends StatefulWidget {
  final List<Lyric> lyrics;

  final GestureTapCallback? onTapClose;

  const LyricContent({super.key, this.onTapClose, required this.lyrics});

  static const iconCloseKey = Key('icon-close');

  @override
  State<LyricContent> createState() => _LyricContentState();
}

class _LyricContentState extends State<LyricContent> {
  late Lyric selectedLyric;

  @override
  void initState() {
    super.initState();
    selectedLyric = widget.lyrics[0];
  }

  void _changeTranslation(Lyric lyric) {
    setState(() {
      selectedLyric = lyric;
    });
  }

  String _translationLabel(Lyric lyric) {
    if (lyric.translationType == null) {
      return 'Original';
    }

    if (lyric.cultureCode != null && lyric.cultureCode!.isNotEmpty) {
      return '${lyric.translationType} (${lyric.cultureCode})';
    }

    return lyric.translationType!;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: widget.onTapClose,
            child: Container(
              key: LyricContent.iconCloseKey,
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
