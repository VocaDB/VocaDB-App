import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vocadb_app/src/features/artists/presentation/artists_list_screen/artists_list_filter_screen.dart';
import 'package:vocadb_app/src/features/artists/presentation/widgets/dropdown_artist_sort.dart';
import 'package:vocadb_app/src/features/artists/presentation/widgets/dropdown_artist_types.dart';

class ArtistsListFilterScreenRobot {
  final WidgetTester tester;

  ArtistsListFilterScreenRobot(this.tester);

  Future<void> pumpArtistsListFilterScreen({
    Function(String?)? onArtistTypesChanged,
    Function(String?)? onSortChanged,
  }) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: ArtistsFilterScreen(
            onArtistTypesChanged: onArtistTypesChanged,
            onSortChanged: onSortChanged,
          ),
        ),
      ),
    );
  }

  Future<void> selectArtistTypes(String value) async {
    final artistTypeDropdownBtnFinder =
        find.byKey(DropdownArtistTypes.dropdownKey);
    expect(artistTypeDropdownBtnFinder, findsOneWidget);

    await tester.tap(artistTypeDropdownBtnFinder);
    await tester.pump();

    final selectedFinder = find.text(value).last;
    expect(selectedFinder, findsOneWidget);
    await tester.tap(selectedFinder);
    await tester.pump();
  }

  Future<void> selectSort(String value) async {
    final artistTypeDropdownBtnFinder =
        find.byKey(DropdownArtistSort.dropdownKey);
    expect(artistTypeDropdownBtnFinder, findsOneWidget);

    await tester.tap(artistTypeDropdownBtnFinder);
    await tester.pump();

    final selectedFinder = find.text(value).last;
    expect(selectedFinder, findsOneWidget);
    await tester.tap(selectedFinder);
    await tester.pump();
  }
}
