import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class Markdown extends StatelessWidget {
  const Markdown({super.key, required this.data});

  final String data;

  @override
  Widget build(BuildContext context) {
    return MarkdownBody(
      data: data,
      styleSheet: MarkdownStyleSheet(
          blockquoteDecoration: const BoxDecoration(
        color: Colors.black26,
      )),
    );
  }
}
