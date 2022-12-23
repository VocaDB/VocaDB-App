import 'package:flutter/material.dart';

class HomeContentList extends StatelessWidget {
  const HomeContentList({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: children.length,
      itemBuilder: (context, index) => children[index],
    );
  }
}
