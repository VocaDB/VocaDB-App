import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:vocadb/app_theme.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/blocs/favorite_album_bloc.dart';
import 'package:vocadb/blocs/favorite_artist_bloc.dart';
import 'package:vocadb/blocs/favorite_song_bloc.dart';
import 'package:vocadb/blocs/home_bloc.dart';
import 'package:vocadb/blocs/profile_bloc.dart';
import 'package:vocadb/blocs/ranking_bloc.dart';
import 'package:vocadb/global_variables.dart';
import 'package:vocadb/pages/album/album_page.dart';
import 'package:vocadb/pages/album_detail/album_detail_page.dart';
import 'package:vocadb/pages/artist/artist_page.dart';
import 'package:vocadb/pages/artist_detail/artist_detail_page.dart';
import 'package:vocadb/pages/event_detail/event_detail_page.dart';
import 'package:vocadb/pages/main/ranking_filter_page.dart';
import 'package:vocadb/pages/release_event/release_event_page.dart';
import 'package:vocadb/pages/search/more_album_page.dart';
import 'package:vocadb/pages/search/more_song_page.dart';
import 'package:vocadb/pages/search/search_page.dart';
import 'package:vocadb/pages/song/song_page.dart';
import 'package:vocadb/pages/song_detail/song_detail_page.dart';
import 'package:vocadb/pages/tag/tag_page.dart';
import 'package:vocadb/pages/tag_detail/tag_detail_page.dart';
import 'package:vocadb/pages/users/favorite_album_page.dart';
import 'package:vocadb/pages/users/favorite_artist_page.dart';
import 'package:vocadb/pages/users/favorite_song_page.dart';
import 'package:vocadb/pages/youtube_playlist/youtube_playlist_page.dart';

import 'pages/main/account_tab.dart';
import 'pages/main/home_tab.dart';
import 'pages/main/ranking_tab.dart';

void main() async {
  var dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);

  await GlobalVariables.init();
  await Hive.openBox('personal');

  runApp(VocaDBApp());
}

class VocaDBApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ConfigBloc configBloc = ConfigBloc(GlobalVariables.pref);

    final favoriteSongBloc = FavoriteSongBloc();
    final favoriteArtistBloc = FavoriteArtistBloc();
    final favoriteAlbumBloc = FavoriteAlbumBloc();
    final profileBloc = ProfileBloc(
      favoriteSongBloc: favoriteSongBloc,
      favoriteArtistBloc: favoriteArtistBloc,
      favoriteAlbumBloc: favoriteAlbumBloc,
    );

    return MultiProvider(
      providers: [
        Provider<ConfigBloc>.value(value: configBloc),
        Provider<HomeBloc>.value(value: HomeBloc(configBloc)),
        Provider<RankingBloc>.value(value: RankingBloc(configBloc)),
        Provider<FavoriteSongBloc>.value(value: favoriteSongBloc),
        Provider<FavoriteArtistBloc>.value(value: favoriteArtistBloc),
        Provider<FavoriteAlbumBloc>.value(value: favoriteAlbumBloc),
        Provider<ProfileBloc>.value(value: profileBloc),
      ],
      child: RootApp(),
    );
  }
}

class RootApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final config = Provider.of<ConfigBloc>(context);
    return StreamBuilder(
      stream: config.uiConfigs$,
      builder: (context, snapshot) {
        return MaterialApp(
          title: 'VocaDB',
          theme: config.getThemeData(Provider.of<ConfigBloc>(context).theme),
          darkTheme: AppTheme.darkTheme,
          initialRoute: '/',
          localizationsDelegates: [
            FlutterI18nDelegate(
                useCountryCode: false,
                fallbackFile: 'assets/i18n/en',
                path: 'assets/i18n',
                forcedLocale: Locale.fromSubtags(
                    languageCode: Provider.of<ConfigBloc>(context).uiLang)),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
          supportedLocales: [
            const Locale('en'), // English
            const Locale('th'), // Hebrew
            // ... other locales the app supports
          ],
          routes: {
            '/': (context) => MyHomePage(title: 'VocaDB Demo Home Page'),
            SongDetailScreen.routeName: (context) => SongDetailScreen(),
            AlbumDetailScreen.routeName: (context) => AlbumDetailScreen(),
            ArtistDetailScreen.routeName: (context) => ArtistDetailScreen(),
            TagDetailScreen.routeName: (context) => TagDetailScreen(),
            ReleaseEventDetailScreen.routeName: (context) =>
                ReleaseEventDetailScreen(),
            FavoriteSongScreen.routeName: (context) => FavoriteSongScreen(),
            FavoriteArtistScreen.routeName: (context) => FavoriteArtistScreen(),
            FavoriteAlbumScreen.routeName: (context) => FavoriteAlbumScreen(),
            MoreSongScreen.routeName: (context) => MoreSongScreen(),
            MoreAlbumScreen.routeName: (context) => MoreAlbumScreen(),
            SongScreen.routeName: (context) => SongScreen(),
            ArtistScreen.routeName: (context) => ArtistScreen(),
            AlbumScreen.routeName: (context) => AlbumScreen(),
            TagScreen.routeName: (context) => TagScreen(),
            ReleaseEventScreen.routeName: (context) => ReleaseEventScreen(),
            SearchScreen.routeName: (context) => SearchScreen(),
            YoutubePlaylistScreen.routeName: (context) =>
                YoutubePlaylistScreen(),
          },
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

  @override
  Widget build(BuildContext context) {
    final homeBloc = Provider.of<HomeBloc>(context);
    final rankingBloc = Provider.of<RankingBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('VocaDB'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () =>
                Navigator.pushNamed(context, SearchScreen.routeName),
          ),
          (_selectedIndex != 1)
              ? Container()
              : IconButton(
                  icon: Icon(Icons.filter_list),
                  onPressed: () => RankingFilterPage.navigate(context)),
        ],
      ),
      body: Center(
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 100),
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(FlutterI18n.translate(context, 'label.home')),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up),
            title: Text(FlutterI18n.translate(context, 'label.ranking')),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            title: Text(FlutterI18n.translate(context, 'label.menu')),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          switch (index) {
            case 0:
              homeBloc.fetch();
              break;
            case 1:
              rankingBloc.fetch();
              break;
          }

          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
