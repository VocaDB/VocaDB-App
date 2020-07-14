import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocadb/bloc/bloc.dart';
import 'package:vocadb/views/views.dart';

class MainPage extends StatefulWidget {
  static const String routeName = '/';

  static void navigate(BuildContext context) {
    Navigator.pushNamed(context, MainPage.routeName);
  }

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    RankingPage(),
    MenuPage(),
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
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu),
                  title: Text('Menu', key: Key('tab_menu')),
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
