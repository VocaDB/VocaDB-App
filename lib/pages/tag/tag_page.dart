import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vocadb/blocs/search_tag_bloc.dart';
import 'package:vocadb/models/tag_model.dart';
import 'package:vocadb/pages/tag_detail/tag_detail_page.dart';
import 'package:vocadb/widgets/result.dart';

class TagScreen extends StatelessWidget {
  static const String routeName = '/tags';

  static void navigate(BuildContext context) {
    Navigator.pushNamed(context, TagScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Provider<SearchTagBloc>(
      builder: (context) => SearchTagBloc(),
      dispose: (context, bloc) => bloc.dispose(),
      child: TagPage(),
    );
  }
}

class TagPage extends StatelessWidget {
 Widget buildData(List<TagModel> tags) {
    return ListView.builder(
      itemCount: tags.length,
      itemBuilder: (context, index) {
        TagModel tag = tags[index];
        return ListTile(
          onTap: () => TagDetailScreen.navigate(context),
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

  @override
  Widget build(BuildContext context) {

    final bloc = Provider.of<SearchTagBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Tags'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {},
          ),
        ],
      ),
      body: StreamBuilder(
        stream: bloc.result$,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return buildData(snapshot.data);
          } else if (snapshot.hasError) {
            return buildError(snapshot.error.toString());
          }

          return buildDefault();
        },
      ),
    );
  }
}