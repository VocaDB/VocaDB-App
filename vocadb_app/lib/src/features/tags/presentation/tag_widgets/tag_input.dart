import 'package:flutter/material.dart';

class TagInput extends StatelessWidget {
  const TagInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ListTile(
          title: Text('Tags'),
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(Icons.add),
          title: const Text('Add'),
        )
      ],
    );
  }
}
