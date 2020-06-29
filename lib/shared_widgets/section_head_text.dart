import 'package:flutter/material.dart';

class SectionHeadText extends StatelessWidget {
  final String data;

  const SectionHeadText(this.data) : assert(data != null);

  @override
  Widget build(BuildContext context) {
    return Text(data,
        style: Theme.of(context).textTheme.subtitle1,
        textDirection: TextDirection.ltr,
        maxLines: 1,
        overflow: TextOverflow.ellipsis);
  }
}
