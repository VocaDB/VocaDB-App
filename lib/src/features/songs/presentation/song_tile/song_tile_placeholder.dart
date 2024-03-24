import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SongTilePlaceholder extends StatelessWidget {
  const SongTilePlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: SizedBox(
          height: 100,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 120,
                  height: 80,
                  color: Colors.white,
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 2.0, 0.0, 2.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 100,
                        height: 16,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: 200,
                        height: 16,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: 40,
                        height: 16,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
