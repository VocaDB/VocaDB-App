import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/// A widget display placeholder for song
class SongCardPlaceholder extends StatelessWidget {
  const SongCardPlaceholder({super.key});

@override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 130,
              height: 80,
              color: Colors.white,
            ),
            const SizedBox(
              height: 6,
            ),
            Container(
              width: 130,
              height: 8,
              color: Colors.white,
            ),
            const SizedBox(
              height: 6,
            ),
            Container(
              width: 80,
              height: 8,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
