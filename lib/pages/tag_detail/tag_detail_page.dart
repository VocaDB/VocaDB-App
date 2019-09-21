import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:vocadb/models/song_model.dart';
import 'package:vocadb/models/tag_model.dart';
import 'package:vocadb/services/web_service.dart';
import 'package:vocadb/widgets/model_future_builder.dart';
import 'package:vocadb/widgets/result.dart';
import 'package:vocadb/widgets/section.dart';
import 'package:vocadb/widgets/song_card.dart';

class TagDetailPage extends StatelessWidget {
  final int id;
  final String name;

  const TagDetailPage(this.id, this.name);

  buildData(TagModel tag) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 200.0,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text("#" + this.name),
            background: (tag.imageUrl == null)
                ? Container()
                : CachedNetworkImage(
                    imageUrl: tag.imageUrl,
                    placeholder: (context, url) =>
                        Container(color: Colors.grey),
                    errorWidget: (context, url, error) => new Icon(Icons.error),
                  ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate.fixed([
            SongListSection('Latest songs',
                WebService().load(SongModel.latestByTagId(this.id))),
            SongListSection(
                'Top songs', WebService().load(SongModel.topByTagId(this.id)))
          ]),
        )
      ],
    );
  }

  buildError(Object error) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 200.0,
          pinned: true,
        ),
        SliverFillRemaining(
          child: Center(
            child: Result.error("Error", subtitle: error.toString()),
          ),
        )
      ],
    );
  }

  buildLoading() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 200.0,
          pinned: true,
        ),
        SliverFillRemaining(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModelFutureBuilder<TagModel>(
        future: WebService().load(TagModel.byId(this.id)),
        buildData: (tag) => buildData(tag),
        buildError: (err) => buildError(err),
        buildLoading: () => buildLoading(),
      ),
    );
  }
}

class SongListSection extends StatelessWidget {
  final String title;
  final Future<List<SongModel>> future;

  const SongListSection(this.title, this.future);

  buildHasData(List<SongModel> songs) {
    List<SongCard> songCards = songs
        .map((song) => SongCard.song(song, tag: '${this.title}_${song.id}'))
        .toList();
    return Section(title: title, horizontal: true, children: songCards);
  }

  buildDefault() {
    return Section(
        title: title,
        horizontal: true,
        children: [0, 1, 2].map((i) => SongCardPlaceholder()).toList());
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SongModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData)
          return buildHasData(snapshot.data);
        else if (snapshot.hasError) {
          print(snapshot.error);
        }

        return buildDefault();
      },
    );
  }
}
