import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:vocadb/models/artist_model.dart';

class ArtistStreamFilters extends StatelessWidget {
  final Function onBrowseArtists;
  final Stream artists$;
  final Function onDeleteArtist;

  const ArtistStreamFilters(
      {Key key, this.onBrowseArtists, this.artists$, this.onDeleteArtist})
      : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(
            FlutterI18n.translate(context, 'label.artists'),
          ),
        ),
        StreamBuilder(
          stream: artists$,
          builder: (context, snapshot) {
            List<ArtistModel> artists = (snapshot.hasData)
                ? (snapshot.data as Map<int, ArtistModel>).values.toList()
                : [];

            if (artists.length == 0) return Container();

            return Column(
              children: artists
                  .map((v) => ListTile(
                        onTap: () {},
                        trailing: IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () {
                            this.onDeleteArtist(v);
                          },
                        ),
                        leading: buildLeading(v.imageUrl),
                        title: Text(v.name),
                        subtitle: Text(v.artistType),
                      ))
                  .toList(),
            );
          },
        ),
        ListTile(
          onTap: () {
            this.onBrowseArtists();
          },
          leading: Icon(Icons.add),
          title: Text('ADD ARTIST'),
        ),
      ],
    );
  }
}
