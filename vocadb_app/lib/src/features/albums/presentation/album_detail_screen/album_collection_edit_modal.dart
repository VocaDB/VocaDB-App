import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/common_widgets/simple_dropdown_input.dart';
import 'package:vocadb_app/src/constants/app_sizes.dart';
import 'package:vocadb_app/src/features/albums/domain/album.dart';
import 'package:vocadb_app/src/features/albums/presentation/album_detail_screen/album_detail_controller.dart';

class AlbumCollectionEditModal {
  final BuildContext context;

  final Album album;

  AlbumCollectionEditModal(this.context, this.album);

  Widget build() {
    return SizedBox(
      height: 400,
      child: Padding(
        padding: const EdgeInsets.all(Sizes.p16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Edit album in collection',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            gapH16,
            Consumer(
              builder: ((context, ref, child) {
                final value = ref.watch(albumDetailControllerProvider(album.id)
                    .select((value) => value.albumCollection));
                return Form(
                  child: Column(
                    children: [
                      SimpleDropdownInput(
                        value: value.purchaseStatus ?? 'Nothing',
                        label: 'Status',
                        onChanged: (value) {
                          ref.read(albumDetailControllerProvider(album.id).notifier)
                            .updatePurchaseStatus(value!);
                        },
                        items: const [
                          SimpleDropdownItem(name: 'Nothing', value: 'Nothing'),
                          SimpleDropdownItem(
                              name: 'Wishlisted', value: 'Wishlisted'),
                          SimpleDropdownItem(name: 'Ordered', value: 'Ordered'),
                          SimpleDropdownItem(name: 'Owned', value: 'Owned'),
                        ],
                      ),
                      SimpleDropdownInput(
                        value: value.mediaType ?? 'Other',
                        label: 'Media type',
                        onChanged: (value) {
                          ref.read(albumDetailControllerProvider(album.id).notifier)
                            .updateMediaType(value!);
                        },
                        items: const [
                          SimpleDropdownItem(
                              name: 'Unpsecified', value: 'Other'),
                          SimpleDropdownItem(
                              name: 'Physical disc', value: 'PhysicalDisc'),
                          SimpleDropdownItem(
                              name: 'Digital download',
                              value: 'DigitalDownload'),
                        ],
                      ),
                      gapH16,
                      RatingBar.builder(
                        initialRating: value.rating.toDouble(),
                        minRating: 0,
                        direction: Axis.horizontal,
                        itemCount: 5,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                           ref.read(albumDetailControllerProvider(album.id).notifier)
                            .updateRating(rating.toInt());
                        },
                      ),
                      gapH16,
                      const Divider(),
                      gapH16,
                      ElevatedButton(
                        onPressed: () {
                          
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50), // NEW
                        ),
                        child: const Text('Save'),
                      )
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
