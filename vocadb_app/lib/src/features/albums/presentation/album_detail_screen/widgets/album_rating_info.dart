import 'package:flutter/material.dart';
import 'package:vocadb_app/src/constants/app_sizes.dart';
import 'package:vocadb_app/src/features/albums/domain/album.dart';

class AlbumRatingInfo extends StatelessWidget {
  const AlbumRatingInfo({super.key, required this.album});

  final Album album;

  static const totalRatingKey = Key('total-ratings-key');
  static const avgRatingKey = Key('avg-rating-key');

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          key: totalRatingKey,
          children: [
            Text(
              album.ratingCount.toString(),
            ),
            gapH4,
            Text(
              'Total Ratings',
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
        Column(
          key: avgRatingKey,
          children: [
            Text('★ ${album.ratingAverage} / 5'),
            gapH4,
            Text(
              'Average Rating',
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      ],
    );
  }
}
