import 'package:vocadb_app/src/features/albums/domain/album.dart';
import 'package:vocadb_app/src/features/artists/domain/artist.dart';
import 'package:vocadb_app/src/features/artists/domain/artist_role.dart';
import 'package:vocadb_app/src/features/pvs/domain/pv.dart';
import 'package:vocadb_app/src/features/songs/domain/lyric.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';
import 'package:vocadb_app/src/features/tags/domain/tag.dart';
import 'package:vocadb_app/src/features/tags/domain/tag_usage.dart';
import 'package:vocadb_app/src/features/weblinks/domain/web_link.dart';

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
  artistRoles: [
    ArtistRole(
      id: '661',
      name: 'wowaka',
      categories: 'Producer',
      artist: Artist(
        id: '53',
        name: 'wowaka',
        imageUrl: 'https://vocadb.net/Artist/Picture/53',
        artistType: 'Producer',
      ),
    ),
    ArtistRole(
      id: '662',
      name: '初音ミク',
      categories: 'Vocalist',
      artist: Artist(
        id: '1',
        name: '初音ミク',
        imageUrl: 'https://vocadb.net/Artist/Picture/1',
        artistType: 'Vocaloid',
      ),
    ),
  ],
  albums: [
    Album(
      id: '445',
      imageUrl: 'https://vocadb.net/Album/CoverPicture/445',
      name: 'EXIT TUNES PRESENTS Supernova 2',
      artistString: 'Various artists',
      discType: 'Compilation',
    ),
    Album(
      id: '414',
      imageUrl: 'https://vocadb.net/Album/CoverPicture/414',
      name: 'EXIT TUNES PRESENTS Vocalogenesis feat. 初音ミク',
      artistString: 'Various artists',
      discType: 'Compilation',
    ),
    Album(
      id: '661',
      imageUrl: 'https://vocadb.net/Album/CoverPicture/661',
      name: 'SEVEN GIRLS\' DISCORD',
      artistString: 'wowaka, 非日常レコーズ feat. various',
      discType: 'EP',
    ),
  ],
  lyrics: [
    Lyric(
      id: '97',
      cultureCode: 'ja',
      source: 'MikuWiki',
      translationType: 'Original',
      url: 'http://www5.atwiki.jp/hmiku/pages/8759.html',
      value:
          'ロンリーガールはいつまでも　届かない夢見て \r\n騒ぐ頭の中を掻き回して、掻き回して。\r\n\r\n「問題ない。」と呟いて、言葉は失われた？ \r\nもう失敗、もう失敗。 \r\n間違い探しに終われば、また、回るの！\r\n\r\nもう一回、もう一回。 \r\n「私は今日も転がります。」と、 \r\n少女は言う　少女は言う \r\n言葉に意味を奏でながら！\r\n\r\n「もう良いかい？」 \r\n「まだですよ、まだまだ先は見えないので。息を 止\r\nと\r\nめるの、今。」\r\n\r\nローリンガールの成れの果て　届かない、向こうの色 \r\n重なる声と声を混ぜあわせて、混ぜあわせて。\r\n\r\n「問題ない。」と呟いた言葉は失われた。 \r\nどうなったって良いんだってさ、 \r\n間違いだって起こしちゃおうと誘う、坂道。\r\n\r\nもう一回、もう一回。 \r\n私をどうか転がしてと \r\n少女は言う　少女は言う \r\n無口に意味を重ねながら！\r\n\r\n「もう良いかい？」 \r\n「もう少し、もうすぐ何か見えるだろうと。息を 止\r\nと\r\nめるの、今。」\r\n\r\nもう一回、もう一回。 \r\n「私は今日も転がります。」と、 \r\n少女は言う　少女は言う \r\n言葉に笑みを奏でながら！\r\n\r\n「もう良いかい？もう良いよ。そろそろ君も疲れたろう、ね。」\r\n\r\n息を 止\r\nや\r\nめるの、今。',
    ),
    Lyric(
      id: '98',
      cultureCode: '',
      source: 'yorokondesuru',
      translationType: 'Romanized',
      url: 'http://yorokondesuru.blogspot.com/2010/03/rolling-girl-romaji.html',
      value:
          'RONRII GAARU wa itsu made mo todoka nai yume mite\r\nsawagu atama no naka o kaki mawashite, kaki mawashite\r\n\r\n"mondai nai" to tsubuyaite, kotoba wa ushinawareta?\r\n\r\nmou shippai, mou shippai\r\nmachigai sagashi ni owareba, mata, mawaru no!\r\n\r\nmou ikai, mou ikai\r\n"watashi wa kyou mo korogari masu" to\r\nshoujo wa iu shoujo wa iu\r\nkotoba ni imi o kanade nagara!\r\n\r\n"mou ii kai?"\r\n"mada desu yo, madamada saki wa mie nai node. iki o tomeru no, ima"\r\n\r\nROORIN GAARU no narenohate todoka nai, mukou no iro\r\nkasanaru koe to koe o maze awasete, maze awasete\r\n\r\n"mondai nai" to tsubuyai ta kotoba wa ushinawareta\r\ndounattatte yoi n datte sa\r\nmachigai datte okoshi chaou to sasou, sakamichi\r\n\r\nmou ikai, mou ikai \r\nwatashi o douka korogashite to\r\nshoujo wa iu shoujo wa iu\r\nmukuchi ni imi o kasane nagara!\r\n\r\n"mou ii kai?"\r\n"mousukoshi, mousugu nani ka mieru daro u to. iki o tomeru no, ima"\r\n\r\nmou ikai, mou ikai \r\n"watashi wa kyou mo korogari masu" to\r\nshoujo wa iu shoujo wa iu\r\nkotoba ni imi o kanade nagara!\r\n\r\n"mou ii kai? mou ii yo. sorosoro kimi mo tsukare ta rou, ne"\r\niki o yameru no, ima',
    ),
    Lyric(
      id: '99',
      cultureCode: 'en',
      source: 'Vocaloid Wiki',
      translationType: 'Translation',
      url:
          'http://vocaloid.fandom.com/wiki/%E3%83%AD%E3%83%BC%E3%83%AA%E3%83%B3%E3%82%AC%E3%83%BC%E3%83%AB_(Rolling_Girl)#Approved English lyrics',
      value:
          'For lonely girls, it\'s always the same, dreaming dreams that don\'t come true\nAnd churning, churning through the clamor in their heads\n\nA lonely girl mutters "I\'m fine", have words failed her?\nA failure, a failure.\nObsessing over her mistakes makes everything spin again!\n\nOne more time, one more time\n"I\'ll roll along again today"\nThe girl said, the girl said\nBreathing life into the words!\n\n"How about now?"\n\n"Not yet, we still can\'t see what\'s ahead. Hold your breath, now."\n\nThis is how it ends for a Rolling Girl, unable to reach the colors on the other side\nThe overlapping voices, they blend together, blend together\n\nShe mutters, "I\'m fine.", but the words fail her\nNot caring how it ends\nAn upward climb that invites mistakes\n\nOne more time, one more time\nPlease, get me rolling\nThe girl said, the girl said\nWith her intense silence!\n\n"How about now?"\n\n"Just a little more, we should see something soon. Hold your breath, now."\n\nOne more time, one more time\n"I\'ll roll along again today"\nThe girl said, the girl said\nBreathing laughter into the words!\n\n"How about now? OK, you can look. You must be exhausted too, right?"\n\nStop breathing, now.',
    ),
  ],
  pvs: [
    PV(
      id: '356640',
      name: '初音ミク　オリジナル曲　「ローリンガール」',
      service: 'NicoNicoDouga',
      pvType: 'Original',
      url: 'http://www.nicovideo.jp/watch/sm9714351',
    ),
    PV(
      id: '356641',
      name:
          'wowaka 『ローリンガール』feat. 初音ミク / wowaka - Rollin Girl (Official Video) ft. Hatsune Miku',
      service: 'Youtube',
      pvType: 'Original',
      url: 'https://youtu.be/vnw8zURAxkU',
    ),
    PV(
      id: '356642',
      name: 'Hatsune miku - rolling girl',
      service: 'SoundCloud',
      pvType: 'Reprint',
      url: 'http://soundcloud.com/hatsune_uke/hatsune-miku-rolling-girl',
    ),
  ],
  webLinks: [
    WebLink(
      id: '3988',
      description: 'NicoNicoPedia',
      category: 'Reference',
      url: 'http://dic.nicovideo.jp/v/sm9714351',
    ),
    WebLink(
      id: '6144',
      description: 'UtaiteDB',
      category: 'Reference',
      url: 'http://utaitedb.net/S/2860',
    ),
    WebLink(
      id: '6145',
      description: 'MikuWiki',
      category: 'Reference',
      url: 'http://www5.atwiki.jp/hmiku/pages/8759.html',
    ),
    WebLink(
      id: '82946',
      description: 'Pixiv (Illustration)',
      category: 'Official',
      url:
          'https://www.pixiv.net/member_illust.php?mode=medium&illust_id=10324371',
    ),
  ],
);
