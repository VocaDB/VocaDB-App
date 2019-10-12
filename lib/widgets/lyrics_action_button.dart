import 'package:flutter/material.dart';
import 'package:vocadb/widgets/action_button.dart';

class LyricsActionButton extends ActionButton {

  final GestureTapCallback onTap;

  const LyricsActionButton({Key key, this.onTap}) : super(key: key, onTap: onTap, icon: Icons.note, label: 'Lyrics');
}
