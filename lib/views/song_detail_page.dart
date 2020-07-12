import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocadb/bloc/bloc.dart';
import 'package:vocadb/models/models.dart';
import 'package:vocadb/parameters/parameters.dart';
import 'package:vocadb/shared_widgets/shared_widgets.dart';

class SongDetailPageArguments {
  final SongModel song;
  final String tag;
  SongDetailPageArguments(this.song, {this.tag});
}

class SongDetailPage extends StatefulWidget {
  static const String routeName = 'songDetail';

  final SongBloc songBloc;

  static void navigate(BuildContext context, SongModel song, {String tag}) {
    Navigator.pushNamed(context, SongDetailPage.routeName,
        arguments: SongDetailPageArguments(song, tag: tag));
  }

  const SongDetailPage({this.songBloc}) : assert(songBloc != null);

  @override
  _SongDetailPageState createState() => _SongDetailPageState();
}

class _SongDetailPageState extends State<SongDetailPage> {
  @override
  Widget build(BuildContext context) {
    final SongDetailPageArguments args =
        ModalRoute.of(context).settings.arguments;

    widget.songBloc.add(FetchSongDetail(args.song.id,
        songParameter: SongParameter(
            fields:
                'MainPicture,PVs,ThumbUrl,Albums,Artists,Tags,WebLinks,AdditionalNames,WebLinks,Lyrics')));

    return BlocBuilder<SongBloc, SongState>(
      bloc: widget.songBloc,
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: Text(args.song.name),
        ),
        body: buildByState(context, state),
      ),
    );
  }

  buildDefaultState(BuildContext context) {
    final SongDetailPageArguments args =
        ModalRoute.of(context).settings.arguments;
    return (args.song.thumbUrl == null || args.tag == null)
        ? LoadingIndicator()
        : Column(
            children: <Widget>[
              Container(
                height: 200,
                width: double.infinity,
                child: Hero(
                  tag: args.tag,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: args.song.thumbUrl,
                    placeholder: (context, url) =>
                        Container(color: Colors.grey),
                    errorWidget: (context, url, error) => new Icon(Icons.error),
                  ),
                ),
              ),
              Expanded(
                child: LoadingIndicator(),
              )
            ],
          );
  }

  Widget buildByState(BuildContext context, SongState state) {
    if (state is SongDetailLoaded) {
      return (state.song.youtubePV == null)
          ? buildWithoutPlayer(state.song)
          : buildWithPlayer(state.song);
    }

    return buildDefaultState(context);
  }

  Widget buildWithoutPlayer(SongModel song) {
    return Column(
      children: <Widget>[
        Container(
          height: 200,
          width: double.infinity,
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: song.thumbUrl,
            placeholder: (context, url) => Container(color: Colors.grey),
            errorWidget: (context, url, error) => new Icon(Icons.error),
          ),
        ),

        //TODO Build detail content
      ],
    );
  }

  Widget buildWithPlayer(SongModel song) {
    return Column(
      children: <Widget>[
        CustomYoutubePlayer(
          url: song.youtubePV.url,
        ),
        Expanded(
          child: ListView(
            children: buildDetailChildren(song),
          ),
        )
      ],
    );
  }

  List<Widget> buildDetailChildren(SongModel song) {
    return [
      Text(song.name, style: Theme.of(context).textTheme.headline6),
      Hidable(
        condition:
            song.additionalNames != null && song.additionalNames.isNotEmpty,
        child: Text(song.additionalNames),
      ),
    ];
  }
}
