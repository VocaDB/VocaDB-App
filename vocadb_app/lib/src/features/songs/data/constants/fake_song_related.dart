import 'package:vocadb_app/src/features/songs/data/constants/fake_songs_list.dart';
import 'package:vocadb_app/src/features/songs/domain/song_related.dart';

final kFakeSongRelated = SongRelated(
  artistMatches: kFakeSongsList,
  likeMatches: kFakeSongsList,
  tagMatches: kFakeSongsList,
);
