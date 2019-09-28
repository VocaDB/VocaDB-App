import 'package:flutter/material.dart';
import 'package:vocadb/blocs/search_tag_bloc.dart';
import 'package:vocadb/models/tag_model.dart';
import 'package:vocadb/widgets/result.dart';

class SearchTagPage extends StatefulWidget {
  final Function onSelected;

  const SearchTagPage({Key key, this.onSelected}) : super(key: key);

  @override
  _SearchTagPageState createState() => _SearchTagPageState();
}

class _SearchTagPageState extends State<SearchTagPage> {
  final SearchTagBloc bloc = SearchTagBloc();

  Widget buildData(List<TagModel> tags) {
    return ListView.builder(
      itemCount: tags.length,
      itemBuilder: (context, index) {
        TagModel t = tags[index];
        return ListTile(
          onTap: () {
            widget.onSelected(t);
          },
          title: Text(t.name),
        );
      },
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
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                onChanged: bloc.updateQuery,
                style: Theme.of(context).primaryTextTheme.title,
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: "Find tag"),
              ),
            ),
          ],
        ),
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
