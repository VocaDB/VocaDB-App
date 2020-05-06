import 'package:flutter/material.dart';

void main() async {
  runApp(VocaDBApp());
}

class VocaDBApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Refactor VocaDB'),
      ),
      body: Container(
        child: Text('Refactor'),
      ),
    );
  }
}
