import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:provider/provider.dart';
import 'package:vocadb/blocs/tag_bloc.dart';
import 'package:vocadb/models/tag_model.dart';
import 'package:vocadb/pages/tag/tag_category_names.dart';
import 'package:vocadb/pages/tag_detail/tag_detail_page.dart';
import 'package:vocadb/widgets/infinite_list_view.dart';
import 'package:vocadb/widgets/result.dart';

class TagScreen {
  static const String routeName = '/tags';

  static void navigate(BuildContext context) {
    Navigator.pushNamed(context, TagScreen.routeName);
  }
}

class TagPage extends StatefulWidget {
  final Function onSelectTag;

  const TagPage({Key key, this.onSelectTag}) : super(key: key);

  @override
  _TagPageState createState() => _TagPageState();
}

class _TagPageState extends State<TagPage> {
  final TextEditingController _controller = TextEditingController();

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget buildData(List<TagModel> tags) {
    return InfiniteListView(
      itemCount: tags.length,
      onReachLastItem: () {
        Provider.of<TagBloc>(context).fetchMore();
      },
      progressIndicator: InfiniteListView.streamShowProgressIndicator(
          Provider.of<TagBloc>(context).noMoreResult$),
      itemBuilder: (context, index) {
        TagModel tag = tags[index];
        return ListTile(
          onTap: () {
            if (widget.onSelectTag == null) {
              TagDetailScreen.navigate(context, tag.id, tag.name);
            } else {
              widget.onSelectTag(tag);
            }
          },
          title: Text(tag.name),
        );
      },
    );
  }

  Widget buildLeading(String imageUrl) {
    return SizedBox(
      width: 50,
      height: 50,
      child: ClipOval(
          child: Container(
        color: Colors.white,
        child: (imageUrl == null)
            ? Placeholder()
            : CachedNetworkImage(
                imageUrl: imageUrl,
                placeholder: (context, url) => Container(color: Colors.grey),
                errorWidget: (context, url, error) => new Icon(Icons.error),
              ),
      )),
    );
  }

  Widget buildError(String message) {
    return Center(
      child: Result.error("Something wrongs", subtitle: message),
    );
  }

  Widget buildDefault() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildSearchResult() {
    final bloc = Provider.of<TagBloc>(context);

    return StreamBuilder(
      stream: bloc.result$,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return buildData(snapshot.data);
        } else if (snapshot.hasError) {
          return buildError(snapshot.error.toString());
        }

        return buildDefault();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<TagBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: bloc.searching$,
          builder: (context, snapshot) {
            return AnimatedSwitcher(
              duration: Duration(milliseconds: 100),
              child: (snapshot.hasData && snapshot.data)
                  ? Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            controller: _controller,
                            onChanged: bloc.updateQuery,
                            style: Theme.of(context).primaryTextTheme.title,
                            autofocus: true,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: FlutterI18n.translate(
                                    context, 'label.search')),
                          ),
                        ),
                      ],
                    )
                  : Text(FlutterI18n.translate(context, 'label.tags')),
            );
          },
        ),
        actions: <Widget>[
          StreamBuilder(
              stream: bloc.searching$,
              builder: (context, snapshot) {
                return (snapshot.hasData && snapshot.data)
                    ? IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          bloc.updateQuery('');
                          _controller.clear();
                        },
                      )
                    : IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () => bloc.openSearch(),
                      );
              }),
        ],
      ),
      body: StreamBuilder(
        stream: bloc.searching$,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data) {
            return buildSearchResult();
          }
          return TagCategoryNames();
        },
      ),
    );
  }
}
