import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:provider/provider.dart';
import 'package:vocadb/blocs/config_bloc.dart';
import 'package:vocadb/blocs/tag_bloc.dart';
import 'package:vocadb/models/tag_model.dart';
import 'package:vocadb/pages/tag_detail/tag_detail_page.dart';
import 'package:vocadb/widgets/infinite_list_view.dart';
import 'package:vocadb/widgets/result.dart';

class TagCategoryScreenArguments {
  final String category;
  final Function onSelectTag;

  TagCategoryScreenArguments(this.category, {this.onSelectTag});
}

class TagCategoryScreen extends StatelessWidget {
  static const String routeName = '/tags/category';

  static void navigate(BuildContext context, String category,
      {Function onSelectTag}) {
    Navigator.pushNamed(context, TagCategoryScreen.routeName,
        arguments:
            TagCategoryScreenArguments(category, onSelectTag: onSelectTag));
  }

  @override
  Widget build(BuildContext context) {
    final TagCategoryScreenArguments args =
        ModalRoute.of(context).settings.arguments;
    final configBloc = Provider.of<ConfigBloc>(context);

    return Provider<TagBloc>(
      builder: (context) =>
          TagBloc(configBloc: configBloc, category: args.category),
      dispose: (context, bloc) => bloc.dispose(),
      child: TagCategoryPage(
        category: args.category,
        onSelectTag: args.onSelectTag,
      ),
    );
  }
}

class TagCategoryPage extends StatefulWidget {
  final String category;
  final Function onSelectTag;

  const TagCategoryPage({Key key, this.category, this.onSelectTag})
      : super(key: key);

  @override
  _TagCategoryPageState createState() => _TagCategoryPageState();
}

class _TagCategoryPageState extends State<TagCategoryPage> {
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
      showProgressIndicator: !Provider.of<TagBloc>(context).noMoreResult,
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
                  : Text(widget.category),
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
      body: buildSearchResult(),
    );
  }
}
