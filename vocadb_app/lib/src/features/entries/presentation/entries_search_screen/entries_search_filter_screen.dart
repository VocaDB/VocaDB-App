import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/simple_dropdown_input.dart';
import 'package:vocadb_app/src/features/tags/presentation/tag_widgets/tag_input.dart';

class EntriesSearchFilter extends StatelessWidget {
  const EntriesSearchFilter({super.key});

  @override
  Widget build(BuildContext context) {
    const String selectedFilterByValue = 'CreateDate';
    const String selectedVocalistValue = 'Nothing';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter'),
      ),
      body: ListView(
        children: [
          SimpleDropdownInput(
            value: '',
            label: 'Entry type',
            onChanged: (value) {},
            items: const [
              SimpleDropdownItem(name: 'Anything', value: ''),
              SimpleDropdownItem(name: 'Song', value: 'Song'),
              SimpleDropdownItem(name: 'Artist', value: 'Artist'),
              SimpleDropdownItem(name: 'Album', value: 'Album'),
              SimpleDropdownItem(name: 'Event', value: 'Event'),
            ],
          ),
          SimpleDropdownInput(
            value: 'Name',
            label: 'Sort by',
            onChanged: (value) {},
            items: const [
              SimpleDropdownItem(name: 'Name', value: 'Name'),
              SimpleDropdownItem(name: 'AdditionDate', value: 'AdditionDate'),
            ],
          ),
          const TagInput(),
        ],
      ),
    );
  }
}
