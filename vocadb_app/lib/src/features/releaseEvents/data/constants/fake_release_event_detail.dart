import 'package:vocadb_app/src/features/entries/domain/main_picture.dart';
import 'package:vocadb_app/src/features/releaseEvents/domain/release_event.dart';
import 'package:vocadb_app/src/features/releaseEvents/domain/release_event_series.dart';
import 'package:vocadb_app/src/features/tags/data/constants/fake_tags_usage_list.dart';
import 'package:vocadb_app/src/features/weblinks/data/constants/fake_web_links_list.dart';

final kFakeReleaseEventDetail = ReleaseEvent(
  id: 3335,
  additionalNames: '3/9 Miku day 2022',
  name: '3月9日はミクの日 2022',
  description: 'Art by [メレ](https://twitter.com/mele_ck)',
  mainPicture: MainPicture(
    urlOriginal:
        'https://static.vocadb.net/img/releaseevent/mainOrig/3335.jpg?v=4',
  ),
  series: ReleaseEventSeries(
    id: 146,
    name: '3月9日はミクの日',
    additionalNames: '3/9 Miku day',
    description:
        '"[NicoNicoPedia](http://dic.nicovideo.jp/a/3%E6%9C%889%E6%97%A5%E3%81%AF%E3%83%9F%E3%82%AF%E3%81%AE%E6%97%A5):\r\n>初音ミクが世に出て最初の3月9日',
    category: 'Anniversary',
  ),
  webLinks: kFakeWebLinksList,
  tags: kFakeTagsUsageList,
);
