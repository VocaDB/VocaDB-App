import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocadb/bloc/bloc.dart';
import 'package:vocadb/repositories/repositories.dart';
import 'package:vocadb/shared_widgets/shared_widgets.dart';

class SongApiListView extends StatelessWidget {
  /// Title widget (Top-left)
  final Widget title;

  /// Type of event to do
  final SongEvent event;

  /// For Hero widget animation.
  final String tag;

  const SongApiListView(
      {@required this.event, this.title, this.tag = 'songApiListView'})
      : assert(event != null);

  Widget buildHeader(context, state) {
    return Container(
      padding: EdgeInsets.only(left: 8.0),
      height: 48,
      child: Row(
        children: <Widget>[this.title],
      ),
    );
  }

  Widget buildLoadingState(context, state) {
    return SongLoadingListView();
  }

  Widget buildContent(context, state) {
    if (state is SongLoading) {
      return buildLoadingState(context, state);
    }

    if (state is SongEmpty) {
      return InfoMessage.warning(message: 'Empty');
    }

    if (state is SongLoaded) {
      return SongListView(
        songs: state.songs,
        tag: this.tag,
      );
    }

    if (state is Error) {
      return InfoMessage.error(message: 'Error');
    }

    return Container();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final bloc = SongBloc(
        songRepository:
            RepositoryProvider.of<VocaDBRepository>(context).songRepository);
    bloc.add(this.event);
    return BlocBuilder<SongBloc, SongState>(
        bloc: bloc,
        builder: (context, state) {
          return Column(
            children: <Widget>[
              buildHeader(context, state),
              buildContent(context, state)
            ],
          );
        });
  }
}
