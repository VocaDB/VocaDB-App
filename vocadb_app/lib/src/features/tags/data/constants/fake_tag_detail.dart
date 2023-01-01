import 'package:vocadb_app/src/features/tags/domain/tag.dart';
import 'package:vocadb_app/src/features/weblinks/data/constants/fake_web_links_list.dart';

final kFakeTagDetail = Tag(
  id: 29,
  name: 'ballad',
  categoryName: 'Genres',
  additionalNames: 'バラード, balada',
  description:
      'Usually refers to slow, emotional love songs, but can be combined with almost any genre.',
  usageCount: 13001,
  relatedTags: [
    Tag(id: 341, name: 'pop'),
    Tag(id: 375, name: 'RnB'),
    Tag(id: 403, name: 'soft rock'),
    Tag(id: 1724, name: 'musical')
  ],
  webLinks: kFakeWebLinksList,
);
