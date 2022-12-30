import 'package:vocadb_app/src/constants/config.dart';
import 'package:vocadb_app/src/features/albums/data/constants/fake_albums_list.dart';
import 'package:vocadb_app/src/features/artists/data/constants/fake_artist_link_list.dart';
import 'package:vocadb_app/src/features/artists/domain/artist.dart';
import 'package:vocadb_app/src/features/artists/domain/artist_relations.dart';
import 'package:vocadb_app/src/features/entries/domain/main_picture.dart';
import 'package:vocadb_app/src/features/songs/data/test_songs.dart';
import 'package:vocadb_app/src/features/tags/data/constants/fake_tags_usage_list.dart';
import 'package:vocadb_app/src/features/weblinks/data/constants/fake_web_links_list.dart';

final kFakeArtistDetail = Artist(
  id: 1,
  name: 'Hatsune Miku',
  imageUrl: kPlaceholderImageUrl,
  artistType: 'Vocaloid',
  additionalNames: 'Hatsune Miku, 初音未来, Chūyīn Wèilái',
  description:
      'Hatsune Miku (初音ミク) is a singing synthesizer application with a female persona',
  mainPicture: MainPicture(
    mime: "image/png",
    urlOriginal: "https://vocadb.net/Artist/Picture/1?v=32",
    urlSmallThumb: "https://static.vocadb.net/img/artist/mainSmall/1.png?v=32",
    urlThumb: "https://static.vocadb.net/img/artist/mainThumb/1.png?v=32",
    urlTinyThumb: "https://static.vocadb.net/img/artist/mainTiny/1.png?v=32",
  ),
  relations: const ArtistRelations(
    latestAlbums: kFakeAlbumsList,
    latestSongs: kTestSongs,
    popularAlbums: kFakeAlbumsList,
    popularSongs: kTestSongs,
  ),
  releaseDate: '2007-08-31T00:00:00Z',
  tags: kFakeTagsUsageList,
  webLinks: kFakeWebLinksList,
  artistLinks: kFakeArtistLinkList,
);
