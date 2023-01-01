import 'package:vocadb_app/src/features/albums/domain/album.dart';
import 'package:vocadb_app/src/features/albums/domain/track.dart';
import 'package:vocadb_app/src/features/artists/domain/artist.dart';
import 'package:vocadb_app/src/features/artists/domain/artist_role.dart';
import 'package:vocadb_app/src/features/entries/domain/main_picture.dart';
import 'package:vocadb_app/src/features/pvs/domain/pv.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';
import 'package:vocadb_app/src/features/tags/data/constants/fake_tags_usage_list.dart';
import 'package:vocadb_app/src/features/weblinks/data/constants/fake_web_links_list.dart';

final kFakeAlbumDetailSingleDisc = Album(
  id: 1,
  imageUrl: 'https://vocadb.net/Album/CoverPicture/1?v=14',
  name: 'synthesis',
  artistString: 'Tripshots feat. 初音ミク',
  discType: 'Album',
  mainPicture:
      MainPicture(urlOriginal: 'https://vocadb.net/Album/CoverPicture/1?v=1'),
  artists: [
    ArtistRole(
      name: '初音ミク',
      categories: 'Vocalist',
      effectiveRoles: 'Default',
      artist: Artist(
        id: 1,
        name: '初音ミク',
        artistType: 'Vocaloid',
        imageUrl: 'https://vocadb.net/Artist/Picture/1',
      ),
    ),
  ],
  pvs: [
    const PV(
      id: 13,
      name: 'Tripshots album - synthesis - [ anger / Nebula / Extended ] ',
      service: 'service',
      pvType: 'Other',
      url: 'https://youtu.be/yhcvQhj5PVc',
    ),
  ],
  catalogNumber: 'KRHS-90035',
  ratingAverage: 4.66,
  ratingCount: 9,
  releaseDate: ReleaseDate(
    day: 11,
    formatted: '6/11/2009',
    month: 6,
    year: 2009,
  ),
  tags: kFakeTagsUsageList,
  tracks: [
    Track(
      id: 3005,
      discNumber: 1,
      song: const Song(
        id: 1,
        name: 'anger [Extend-RMX]',
        artistString: 'Tripshots feat. 初音ミク',
      ),
      trackNumber: 1,
    ),
    Track(
      id: 3006,
      discNumber: 1,
      song: const Song(
        id: 1767,
        name: 'Extended [Sirius RMX]',
        artistString: 'Tripshots feat. 初音ミク',
      ),
      trackNumber: 2,
    ),
  ],
  webLinks: kFakeWebLinksList,
);

final kFakeAlbumDetailMultiDisc = Album(
  id: 30232,
  imageUrl: 'https://vocadb.net/Album/CoverPicture/30232',
  name: 'HATSUNE MIKU Digital Stars 2021 Compilation',
  artistString: 'Various artists',
  discType: 'Compilation',
  discs: [
    Disc(id: 528, discNumber: 1, mediaType: 'Audio', name: 'CD'),
    Disc(id: 529, discNumber: 2, mediaType: 'Audio', name: 'SONOCA'),
  ],
  catalogNumber: 'HMCD-0016',
  ratingAverage: 4.66,
  ratingCount: 9,
  releaseDate: ReleaseDate(
    day: 11,
    formatted: '6/11/2009',
    month: 6,
    year: 2009,
  ),
  tags: kFakeTagsUsageList,
  tracks: [
    Track(
      id: 3005,
      discNumber: 1,
      song: const Song(
        id: 1,
        name: 'anger [Extend-RMX]',
        artistString: 'Tripshots feat. 初音ミク',
        imageUrl: 'https://vocadb.net/Artist/Picture/1',
      ),
      trackNumber: 1,
    ),
    Track(
      id: 3006,
      discNumber: 2,
      song: const Song(
        id: 1767,
        name: 'Extended [Sirius RMX]',
        artistString: 'Tripshots feat. 初音ミク',
      ),
      trackNumber: 1,
    ),
  ],
  webLinks: kFakeWebLinksList,
);
