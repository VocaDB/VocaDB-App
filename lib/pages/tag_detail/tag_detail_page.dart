import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/blocs/song_detail_bloc.dart';
import 'package:vocadb/blocs/tag_detail_bloc.dart';
import 'package:vocadb/models/song_model.dart';
import 'package:vocadb/models/tag_model.dart';
import 'package:vocadb/services/web_service.dart';
import 'package:vocadb/widgets/model_future_builder.dart';
import 'package:vocadb/widgets/result.dart';
import 'package:vocadb/widgets/section.dart';
import 'package:vocadb/widgets/song_card.dart';

class TagDetailScreenArguments {
  final int id;
  final String name;

  TagDetailScreenArguments(this.id, this.name);
}

class TagDetailScreen extends StatelessWidget {
  static const String routeName = '/tagDetail';

  @override
  Widget build(BuildContext context) {
    final TagDetailScreenArguments args =
        ModalRoute.of(context).settings.arguments;
    final configBloc = Provider.of<ConfigBloc>(context);

    return Provider<TagDetailBloc>(
      builder: (context) => TagDetailBloc(args.id, configBloc: configBloc),
      dispose: (context, bloc) => bloc.dispose(),
      child: TagDetailPage(args.id, args.name),
    );
  }
}

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
          delegate: SliverChildListDelegate.fixed([]),
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
