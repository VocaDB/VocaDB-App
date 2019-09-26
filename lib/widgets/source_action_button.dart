import 'package:flutter/material.dart';
import 'package:vocadb/widgets/action_button.dart';

class SourceActionButton extends ActionButton {

  const SourceActionButton({Key key, GestureTapCallback onTap}) : super(key: key, label: 'Source', icon: Icons.info, onTap: onTap);
}
