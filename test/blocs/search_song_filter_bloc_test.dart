import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb/blocs/search_song_filter_bloc.dart';
import 'package:vocadb/models/artist_model.dart';
import 'package:vocadb/models/tag_model.dart';

main() {
  SearchSongFilterBloc bloc;

  setUp(() {
    bloc = SearchSongFilterBloc();
  });

  test('should update song type', () async {
    bloc.updateSongType('Original');

    await expectLater(bloc.songType$, emits('Original'));

    expect(bloc.songType, equals('Original'));
  });

  test('should update sort', () async {
    bloc.updateSort('CreateDate');

    await expectLater(bloc.sort$, emits('CreateDate'));

    expect(bloc.sort, equals('CreateDate'));
  });

  test('should add and remove artist correctly', () {
    final artist1 = ArtistModel.fromJson({'id': 1, 'name': 'Hatsune Miku_1'});
    final artist2 = ArtistModel.fromJson({'id': 2, 'name': 'Hatsune Miku_2'});
    final artist3 = ArtistModel.fromJson({'id': 3, 'name': 'Hatsune Miku_3'});

    bloc.addArtist(artist1);

    expect(bloc.artists.containsKey(artist1.id), isTrue);

    bloc.addArtist(artist1);
    bloc.addArtist(artist2);
    bloc.addArtist(artist3);

    expect(bloc.artists.containsKey(artist1.id), isTrue);
    expect(bloc.artists.containsKey(artist2.id), isTrue);
    expect(bloc.artists.containsKey(artist3.id), isTrue);

    bloc.removeArtist(artist1.id);

    expect(bloc.artists.containsKey(artist1.id), isFalse);
    expect(bloc.artists.containsKey(artist2.id), isTrue);
    expect(bloc.artists.containsKey(artist3.id), isTrue);
  });

  test('should add and remove tag correctly', () {
    final tag1 = TagModel.fromJson({'id': 1, 'name': 'Tag_1'});
    final tag2 = TagModel.fromJson({'id': 2, 'name': 'Tag_2'});
    final tag3 = TagModel.fromJson({'id': 3, 'name': 'Tag_3'});

    bloc.addTag(tag1);

    expect(bloc.tags.containsKey(tag1.id), isTrue);

    bloc.addTag(tag1);
    bloc.addTag(tag2);
    bloc.addTag(tag3);

    expect(bloc.tags.containsKey(tag1.id), isTrue);
    expect(bloc.tags.containsKey(tag2.id), isTrue);
    expect(bloc.tags.containsKey(tag3.id), isTrue);

    bloc.removeTag(tag1.id);

    expect(bloc.tags.containsKey(tag1.id), isFalse);
    expect(bloc.tags.containsKey(tag2.id), isTrue);
    expect(bloc.tags.containsKey(tag3.id), isTrue);

    Map<String, String> params = bloc.params();
    expect(params.containsKey('tagId'), isTrue);
    expect(params['tagId'], equals('2,3'));
  });

  test('should return params correctly', () {
    Map<String, String> params = bloc.params();

    expect(params.containsKey('songTypes'), isFalse);

    bloc.updateSongType('Original');
    bloc.updateSort('CreateDate');

    params = bloc.params();

    expect(params.containsKey('songTypes'), isTrue);
    expect(params['songTypes'], equals('Original'));

    expect(params.containsKey('sort'), isTrue);
    expect(params['sort'], equals('CreateDate'));
  });
}
