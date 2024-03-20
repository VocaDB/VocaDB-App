import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/constants/app_sizes.dart';
import 'package:vocadb_app/src/features/albums/domain/album.dart';
import 'package:vocadb_app/src/features/albums/domain/album_collection.dart';
import 'package:vocadb_app/src/features/albums/presentation/album_detail_screen/album_collection_edit_modal.dart';
import 'package:vocadb_app/src/features/albums/presentation/album_detail_screen/album_detail_controller.dart';
import 'package:vocadb_app/src/utils/share_launcher.dart';
import 'package:vocadb_app/src/utils/url_launcher.dart';

class AlbumDetailButtonBar extends StatelessWidget {
  const AlbumDetailButtonBar({super.key, required this.album});

  final Album album;

  static const addBtnKey = Key('add-btn-key');
  static const shareBtnKey = Key('share-btn-key');
  static const infoBtnKey = Key('info-btn-key');

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          key: addBtnKey,
          onPressed: () => {
            showModalBottomSheet(
              context: context,
              builder: ((context) =>
                  AlbumCollectionEditModal(context, album).build()),
            )
          },
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          child: Consumer(
            builder: (context, ref, child) {
              final value = ref.watch(albumDetailControllerProvider(album.id)
                  .select((value) => value.albumCollection));
              final isCollected = value?.album != null;
              return Column(
                children: [
                  Icon((isCollected) ? Icons.edit : Icons.add),
                  gapH4,
                  Text((isCollected)
                      ? 'Update my collection'
                      : 'Add to collection'),
                ],
              );
            },
          ),
        ),
        Consumer(builder: (context, ref, _) {
          return TextButton(
            key: shareBtnKey,
            onPressed: () => ref.read(shareLauncherProvider).shareAlbum(album.id),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            child: const Column(
              children: [
                Icon(Icons.share),
                gapH4,
                Text('Share'),
              ],
            ),
          );
        }),
        Consumer(builder: (context, ref, _) {
          return TextButton(
            key: infoBtnKey,
            onPressed: () {
              ref.read(urlLauncherProvider).launchAlbumMoreInfo(album.id);
            },
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            child: const Column(
              children: [
                Icon(Icons.info),
                gapH4,
                Text('Info'),
              ],
            ),
          );
        })
      ],
    );
  }
}

class AlbumCollectionStatusNotifier extends StateNotifier<AlbumCollection> {
  AlbumCollectionStatusNotifier(AlbumCollection albumCollection)
      : super(albumCollection);
}
