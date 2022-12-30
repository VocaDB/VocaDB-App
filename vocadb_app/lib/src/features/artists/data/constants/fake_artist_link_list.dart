import 'package:vocadb_app/src/constants/config.dart';
import 'package:vocadb_app/src/features/artists/domain/artist.dart';
import 'package:vocadb_app/src/features/artists/domain/artist_link.dart';

final kFakeArtistLinkList = [
  ArtistLink(
    linkType: 'Group',
    artist: Artist(
      id: 25,
      name: 'Crypton Future Media',
      artistType: 'Label',
      imageUrl: kPlaceholderImageUrl,
    ),
  ),
  ArtistLink(
    linkType: 'Illustrator',
    artist: Artist(
      id: 9213,
      name: 'KEI',
      artistType: 'Label',
      imageUrl: kPlaceholderImageUrl,
    ),
  ),
  ArtistLink(
    linkType: 'VoiceProvider',
    artist: Artist(
      id: 49761,
      name: '藤田咲',
      artistType: 'OtherVocalist',
      imageUrl: kPlaceholderImageUrl,
    ),
  ),
];
