import 'package:vocadb_app/src/features/songs/domain/song.dart';
import 'package:vocadb_app/src/features/tags/domain/tag.dart';
import 'package:vocadb_app/src/features/tags/domain/tag_usage.dart';

const kTestSong = Song(
  id: '1501',
  name: 'ローリンガール',
  imageUrl: 'https://nicovideo.cdn.nimg.jp/thumbnails/9714351/9714351',
  artistString: 'wowaka feat. 初音ミク',
  songType: 'Original',
  pvServices: 'NicoNicoDouga, Youtube, SoundCloud',
  additionalNames: "Rolling Girl, Rollin' Girl, 翻滚少女",
  tagUsages: [
    TagUsage(
      count: 4,
      tag: Tag(
        id: '16',
        name: 'alternative rock',
        categoryName: 'Genres',
      ),
    ),
    TagUsage(
      count: 6,
      tag: Tag(
        id: '260',
        name: 'melancholic',
        categoryName: 'Subjective',
      ),
    ),
    TagUsage(
      count: 5,
      tag: Tag(
        id: '337',
        name: 'piano',
        categoryName: 'Instruments',
      ),
    ),
  ],
);
