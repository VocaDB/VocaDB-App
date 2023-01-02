import 'package:vocadb_app/src/features/albums/data/constants/fake_albums_list.dart';
import 'package:vocadb_app/src/features/artists/data/constants/fake_artist_link_list.dart';
import 'package:vocadb_app/src/features/artists/domain/artist.dart';
import 'package:vocadb_app/src/features/artists/domain/artist_relations.dart';
import 'package:vocadb_app/src/features/entries/domain/main_picture.dart';
import 'package:vocadb_app/src/features/songs/data/constants/fake_songs_list.dart';
import 'package:vocadb_app/src/features/tags/data/constants/fake_tags_usage_list.dart';
import 'package:vocadb_app/src/features/weblinks/data/constants/fake_web_links_list.dart';

final kFakeArtistDetail = Artist(
  id: 1,
  name: 'Hatsune Miku',
  imageUrl: 'https://vocadb.net/Artist/Picture/1?v=32',
  artistType: 'Vocaloid',
  additionalNames: 'Hatsune Miku, 初音未来, Chūyīn Wèilái',
  description:
      "Hatsune Miku (初音ミク) is a singing synthesizer application with a female persona, developed by Crypton Future Media. It uses Yamaha Corporation's Vocaloid 2 synthesizing technology. The name of the character comes from a fusion of the Japanese for first (初 hatsu), sound (音 ne) and future (Miku (ミク) sounds like a nanori reading of future, 未来, normally read as \"mirai\"), referring to her position as the first of Crypton's \"Character Vocal Series\". She was the second Vocaloid to be sold using the Vocaloid 2 engine and the first Japanese Vocaloid to use the Japanese version of the Vocaloid 2 engine. Her voice is sampled from Japanese voice actress, Saki Fujita. Hatsune Miku has performed at her concerts onstage as a projection.\n\nSource: Wikipedia\n\nEngine: VOCALOID2\nDeveloper: Crypton Future Media\nLanguage: Japanese (English voicebanks and Chinese voicebank available as well)\nVoice Type: Female",
  mainPicture: MainPicture(
    mime: "image/png",
    urlOriginal: "https://vocadb.net/Artist/Picture/1?v=32",
    urlSmallThumb: "https://static.vocadb.net/img/artist/mainSmall/1.png?v=32",
    urlThumb: "https://static.vocadb.net/img/artist/mainThumb/1.png?v=32",
    urlTinyThumb: "https://static.vocadb.net/img/artist/mainTiny/1.png?v=32",
  ),
  relations: ArtistRelations(
    latestAlbums: kFakeAlbumsList,
    latestSongs: kFakeSongsList,
    popularAlbums: kFakeAlbumsList,
    popularSongs: kFakeSongsList,
  ),
  releaseDate: '2007-08-31T00:00:00Z',
  tags: kFakeTagsUsageList,
  webLinks: kFakeWebLinksList,
  artistLinks: kFakeArtistLinkList,
);
