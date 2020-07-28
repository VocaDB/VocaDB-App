import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocadb/bloc/bloc.dart';
import 'package:vocadb/models/models.dart';
import 'package:vocadb/shared_widgets/shared_widgets.dart';

class SongPage extends StatefulWidget {
  static const String routeName = '/songs';

  final SongListBloc songListBloc;

  static void navigate(BuildContext context) {
    Navigator.pushNamed(context, SongPage.routeName);
  }

  const SongPage({this.songListBloc}) : assert(songListBloc != null);

  @override
  _SongPageState createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Songs'),
      ),
      body: BlocBuilder<SongListBloc, SongListState>(
        bloc: widget.songListBloc,
        builder: (context, state) {
          if (state is SongListInitial) {
            widget.songListBloc.add(FetchSongsList());
          }

          if (state is SongListError) {
            return Center(
              child: Text('failed to fetch songs'),
            );
          }

          if (state is SongListLoaded) {
            return InfiniteListView(
              itemCount: state.songs.length,
              onReachLastItem: () {
                widget.songListBloc.add(FetchSongsList());
              },
              progressIndicator: state.hasReachedMax
                  ? Container()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[CircularProgressIndicator()],
                    ),
              itemBuilder: (context, index) {
                SongModel song = state.songs[index];

                return SongTile.fromSong(song);
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
