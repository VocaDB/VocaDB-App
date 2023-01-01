import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:vocadb_app/src/common_widgets/simple_dropdown_input.dart';
import 'package:vocadb_app/src/constants/app_sizes.dart';

class AlbumCollectionEditModal {
  final BuildContext context;

  AlbumCollectionEditModal(this.context);

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
            Form(
              child: Column(
                children: [
                  SimpleDropdownInput(
                    value: '',
                    label: 'Collection status',
                    onChanged: (value) {},
                    items: const [
                      SimpleDropdownItem(name: 'Anything', value: ''),
                      SimpleDropdownItem(
                          name: 'Wishlisted', value: 'Wishlisted'),
                      SimpleDropdownItem(name: 'Ordered', value: 'Ordered'),
                      SimpleDropdownItem(name: 'Owned', value: 'Owned'),
                      SimpleDropdownItem(name: 'All', value: 'All'),
                    ],
                  ),
                  SimpleDropdownInput(
                    value: '',
                    label: 'Media type',
                    onChanged: (value) {},
                    items: const [
                      SimpleDropdownItem(name: 'Anything', value: ''),
                      SimpleDropdownItem(
                          name: 'Physical disc', value: 'PhysicalDisc'),
                      SimpleDropdownItem(
                          name: 'Digital download', value: 'DigitalDownload'),
                      SimpleDropdownItem(name: 'Unpsecified', value: 'Other'),
                    ],
                  ),
                  gapH16,
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  gapH16,
                  const Divider(),
                  gapH16,
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50), // NEW
                    ),
                    child: const Text('Save'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
