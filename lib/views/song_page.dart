import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocadb/bloc/bloc.dart';

class SongPage extends StatefulWidget {
  static const String routeName = '/songs';

  final SongBloc songBloc;

  static void navigate(BuildContext context) {
    Navigator.pushNamed(context, SongPage.routeName);
  }

  const SongPage({this.songBloc}) : assert(songBloc != null);

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
      body: BlocBuilder<SongBloc, SongState>(
        bloc: widget.songBloc,
        builder: (context, state) {
          if (state is SongEmpty) {
            widget.songBloc.add(FetchSongs());
          }
          if (state is SongError) {
            return Center(
              child: Text('failed to fetch songs'),
            );
          }
          if (state is SongLoaded) {
            return ListView.builder(
              itemCount: state.songs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.songs[index].name),
                );
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
