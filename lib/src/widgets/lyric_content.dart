import 'package:flutter/material.dart';
import 'package:vocadb_app/models.dart';

/// A widget for display group of lyrics content
class LyricContent extends StatefulWidget {
  final List<LyricModel> lyrics;

  final GestureTapCallback onTapClose;

  LyricContent({Key key, this.onTapClose, this.lyrics}) : super(key: key);

  @override
  _LyricContentState createState() => _LyricContentState();
}

class _LyricContentState extends State<LyricContent> {
  LyricModel selectedLyric;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedLyric = widget.lyrics[0];
  }

  void _changeTranslation(LyricModel lyricModel) {
    setState(() {
      this.selectedLyric = lyricModel;
    });
  }

  String _translationLabel(LyricModel lyricModel) {
    return lyricModel.translationType +
        ((lyricModel.cultureCode == null || lyricModel.cultureCode.isEmpty)
            ? ''
            : ' (${lyricModel.cultureCode})');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: this.widget.onTapClose,
            child: Container(
              height: 36,
              alignment: Alignment.center,
              child: Icon(Icons.close),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 8.0, left: 8.0),
            child: Row(
                children: widget.lyrics
                    .map((lyric) => Container(
                          margin: EdgeInsets.only(right: 4.0),
                          child: InputChip(
                            backgroundColor: (lyric.translationType ==
                                    selectedLyric.translationType)
                                ? Theme.of(context).chipTheme.selectedColor
                                : Theme.of(context).chipTheme.backgroundColor,
                            onPressed: () => this._changeTranslation(lyric),
                            label: Text(_translationLabel(lyric)),
                          ),
                        ))
                    .toList()),
          ),
          Expanded(
            child: SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 16.0, right: 8.0, left: 8.0),
                child: Text(selectedLyric.value)),
          ),
        ],
      ),
    );
  }
}
