import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vocadb/blocs/lyric_content_bloc.dart';
import 'package:vocadb/models/lyric_model.dart';

class LyricContent extends StatelessWidget {
  final List<LyricModel> lyrics;
  final GestureTapCallback onTapClose;

  LyricContent({Key key, this.onTapClose, this.lyrics}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<LyricContentBloc>(context);

    return StreamBuilder(
        stream: bloc.selectedLyric$,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Container();

          LyricModel selectedLyric = snapshot.data;

          return Container(
            child: Column(
              children: <Widget>[
                InkWell(
                  onTap: this.onTapClose,
                  child: Container(
                    height: 36,
                    alignment: Alignment.center,
                    child: Icon(Icons.arrow_drop_down),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 8.0, left: 8.0),
                  child: Row(
                      children: lyrics
                          .map((lyric) => lyric.translationType)
                          .map((translationType) => Container(
                                margin: EdgeInsets.only(right: 4.0),
                                child: InputChip(
                                  backgroundColor: (translationType ==
                                          selectedLyric.translationType)
                                      ? Theme.of(context)
                                          .chipTheme
                                          .selectedColor
                                      : Theme.of(context)
                                          .chipTheme
                                          .backgroundColor,
                                  onPressed: () =>
                                      bloc.changeTranslation(translationType),
                                  label: Text(translationType),
                                ),
                              ))
                          .toList()),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child:
                        SingleChildScrollView(child: Text(selectedLyric.value)),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
