import 'package:flutter/material.dart';
import 'package:vocadb/widgets/action_button.dart';

class ShareActionButton extends ActionButton {
  const ShareActionButton({Key key, GestureTapCallback onTap}) : super(key: key, label: 'Share', icon: Icons.share, onTap: onTap);
}
