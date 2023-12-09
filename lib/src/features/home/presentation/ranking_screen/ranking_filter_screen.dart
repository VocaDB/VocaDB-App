import 'package:flutter/material.dart';

// TODO : need implementation
class RankingFilterScreen extends StatelessWidget {
  const RankingFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const String selectedFilterByValue = 'CreateDate';
    const String selectedVocalistValue = 'Nothing';

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          const ListTile(
            title: Text('Filter by'),
          ),
          RadioListTile<String>(
            title: const Text('Newly added'),
            value: 'CreateDate',
            groupValue: selectedFilterByValue,
            onChanged: (String? value) {},
          ),
          RadioListTile<String>(
            title: const Text('Newly published'),
            value: 'PublishDate',
            groupValue: selectedFilterByValue,
            onChanged: (String? value) {},
          ),
          RadioListTile<String>(
            title: const Text('Popularity'),
            value: 'Popularity',
            groupValue: selectedFilterByValue,
            onChanged: (String? value) {},
          ),
          const ListTile(
            title: Text('Vocalist'),
          ),
          RadioListTile<String>(
            title: const Text('All vocalists'),
            value: 'Nothing',
            groupValue: selectedVocalistValue,
            onChanged: (String? value) {},
          ),
          RadioListTile<String>(
            title: const Text('Only Vocaloid'),
            value: 'Vocaloid',
            groupValue: selectedVocalistValue,
            onChanged: (String? value) {},
          ),
          RadioListTile<String>(
            title: const Text('UTAU'),
            value: 'UTAU',
            groupValue: selectedVocalistValue,
            onChanged: (String? value) {},
          ),
          RadioListTile<String>(
            title: const Text('Other vocalists'),
            value: 'Other',
            groupValue: selectedVocalistValue,
            onChanged: (String? value) {},
          ),
        ],
      ),
    );
  }
}
