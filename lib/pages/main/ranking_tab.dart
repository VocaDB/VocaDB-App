import 'package:flutter/material.dart';

class RankingTab extends StatefulWidget {
  @override
  _RankingTabState createState() => _RankingTabState();
}

class _RankingTabState extends State<RankingTab>
    with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(text: "Daily"),
    Tab(text: "Weekly"),
    Tab(text: "Monthly"),
    Tab(text: "Overall")
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length, initialIndex: 1);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> tabChildren = myTabs.map((Tab tab) {
      final String label = tab.text.toLowerCase();
      return Center(
        child: Text(
          '$label',
        ),
      );
    }).toList();

    return SafeArea(
      child: Scaffold(
      appBar: TabBar(controller: _tabController, tabs: myTabs),
      body: TabBarView(
        controller: _tabController,
        children: tabChildren,
      )
      )
    );
  }
}
