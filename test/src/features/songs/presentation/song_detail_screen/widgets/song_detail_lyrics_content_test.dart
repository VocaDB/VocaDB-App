import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/src/features/songs/domain/lyric.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/widgets/song_detail_lyrics_content.dart';

void main() {
  testWidgets('song detail lyrics content ...', (tester) async {
    bool tapCloseTriggered = false;
    final lyrics = [
      Lyric(
        id: 1,
        cultureCode: 'ja',
        translationType: 'Original',
        value: 'lyric...A',
      ),
      Lyric(
        id: 2,
        cultureCode: '',
        translationType: 'Romanized',
        value: 'lyric...B',
      ),
      Lyric(
        id: 3,
        cultureCode: 'en',
        translationType: 'Translation',
        value: 'lyric...C',
      )
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Container(
            child: Column(
              children: [
                LyricContent(
                  lyrics: lyrics,
                  onTapClose: () {
                    tapCloseTriggered = true;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );

    await tester.pump();

    final chip1 = find.text('Original (ja)');
    final chip2 = find.text('Romanized');
    final chip3 = find.text('Translation (en)');

    // Default
    expect(chip1, findsOneWidget);
    expect(chip2, findsOneWidget);
    expect(chip3, findsOneWidget);
    expect(find.text(lyrics[0].value!), findsOneWidget);
    expect(find.text(lyrics[1].value!), findsNothing);
    expect(find.text(lyrics[2].value!), findsNothing);

    // Tap chip2
    await tester.tap(chip2);
    await tester.pump();

    expect(find.text(lyrics[0].value!), findsNothing);
    expect(find.text(lyrics[1].value!), findsOneWidget);
    expect(find.text(lyrics[2].value!), findsNothing);

    // Tap chip3
    await tester.tap(chip3);
    await tester.pump();

    expect(find.text(lyrics[0].value!), findsNothing);
    expect(find.text(lyrics[1].value!), findsNothing);
    expect(find.text(lyrics[2].value!), findsOneWidget);

    // Tap close button
    final iconClose = find.byKey(LyricContent.iconCloseKey);
    expect(iconClose, findsOneWidget);

    await tester.tap(iconClose);
    await tester.pump();

    expect(tapCloseTriggered, isTrue);
  });
}
