import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:vocadb/blocs/search_artist_bloc.dart';
import 'package:vocadb/models/artist_model.dart';
import 'package:vocadb/widgets/result.dart';

class SearchArtistPage extends StatefulWidget {
  final Function onSelected;

  const SearchArtistPage({Key key, this.onSelected}) : super(key: key);

  @override
  _SearchArtistPageState createState() => _SearchArtistPageState();
}

class _SearchArtistPageState extends State<SearchArtistPage> {
  final SearchArtistBloc bloc = SearchArtistBloc();

  Widget buildData(List<ArtistModel> artists) {
    return ListView.builder(
      itemCount: artists.length,
      itemBuilder: (context, index) {
        ArtistModel artist = artists[index];
        return ListTile(
          onTap: () {
            widget.onSelected(artist);
            Navigator.pop(context);
          },
          leading: buildLeading(artist.imageUrl),
          title: Text(artist.name),
          subtitle: Text(artist.artistType),
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
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                onChanged: bloc.updateQuery,
                style: Theme.of(context).primaryTextTheme.title,
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: "Find artist"),
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
