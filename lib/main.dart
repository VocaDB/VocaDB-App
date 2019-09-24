import 'package:flutter/material.dart';
import 'package:vocadb/app_theme.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/global_variables.dart';
import 'package:vocadb/providers/global_provider.dart';

import 'pages/main/account_tab.dart';
import 'pages/main/home_tab.dart';
import 'pages/main/ranking_tab.dart';

void main() async {
  await GlobalVariables.init();

  runApp(VocaDBApp());
}

class VocaDBApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GlobalProvider(
      configBloc: ConfigBloc(GlobalVariables.pref),
      child: RootApp(),
    );
  }
}

class RootApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final config = GlobalProvider.of(context).configBloc;
    return StreamBuilder(
      stream: config.themeDataStream,
      builder: (context, snapshot) {
        return MaterialApp(
          title: 'VocaDB Flutter Demo',
          theme: (snapshot.hasData)
              ? config.getThemeData(snapshot.data)
              : AppTheme.darkTheme,
          darkTheme: AppTheme.darkTheme,
          home: MyHomePage(title: 'VocaDB Demo Home Page'),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  List<Widget> _widgetOptions = <Widget>[
    HomeTab(),
    RankingTab(),
    AccountTab(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up),
            title: Text('Ranking'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('Account'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
