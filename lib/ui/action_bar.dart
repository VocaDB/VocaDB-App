import 'package:flutter/material.dart';
import 'package:vocadb/ui/action_button.dart';

class ActionBar extends StatelessWidget {

  final List<ActionButton> actions;

  const ActionBar({
    Key key,
    this.actions
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
//      color: Colors.blueAccent,
      width: double.infinity,
      height: 58,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: this.actions,
      ),
    );
  }
}