import 'package:flutter/material.dart';

class TagDetailPage extends StatelessWidget {

  List<Widget> buildContent() {
    return [
      Text('Expansion panel')
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text("#Project DIVA"),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(buildContent()),
            )
          ],
        ),
      ),
    );
  }
}