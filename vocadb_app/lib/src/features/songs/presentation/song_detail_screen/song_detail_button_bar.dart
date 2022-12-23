import 'package:flutter/material.dart';
import 'package:vocadb_app/src/constants/app_sizes.dart';

class SongDetailButtonBar extends StatelessWidget {
  const SongDetailButtonBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          onPressed: () => {},
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          child: Column(
            children: const [
              Icon(Icons.favorite),
              gapH4,
              Text('Like'),
            ],
          ),
        ),
        TextButton(
          onPressed: () => {},
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          child: Column(
            children: const [
              Icon(Icons.subtitles),
              gapH4,
              Text('Lyrics'),
            ],
          ),
        ),
        TextButton(
          onPressed: () => {},
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          child: Column(
            children: const [
              Icon(Icons.share),
              gapH4,
              Text('Share'),
            ],
          ),
        ),
        TextButton(
          onPressed: () => {},
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          child: Column(
            children: const [
              Icon(Icons.info),
              gapH4,
              Text('Info'),
            ],
          ),
        ),
      ],
    );
  }
}
