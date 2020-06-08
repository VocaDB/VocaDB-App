import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocadb/bloc/bloc.dart';
import 'package:vocadb/views/home_page.dart';
import 'package:vocadb/views/ranking_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    RankingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return Scaffold(
            body: Center(
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 100),
                child: _widgetOptions.elementAt(state.index),
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text('Home', key: Key('tab_home')),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.trending_up),
                  title: Text('Ranking', key: Key('tab_ranking')),
                ),
              ],
              currentIndex: state.index,
              onTap: (index) => BlocProvider.of<MainBloc>(context)
                  .add(TabPressed(index: index)),
            ));
      },
    );
  }
}
