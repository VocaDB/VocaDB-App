import 'package:flutter/material.dart';

class TextInfoTile extends StatelessWidget {
  const TextInfoTile({super.key, required this.title, this.subtitle});

  final String title;

  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: subtitle != null && subtitle!.isNotEmpty,
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle ?? '<None>'),
      ),
    );
  }
}
