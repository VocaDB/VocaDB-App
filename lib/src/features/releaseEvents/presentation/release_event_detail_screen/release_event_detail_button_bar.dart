import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/constants/app_sizes.dart';
import 'package:vocadb_app/src/features/releaseEvents/domain/release_event.dart';
import 'package:vocadb_app/src/utils/url_launcher.dart';

class ReleaseEventDetailButtonBar extends StatelessWidget {
  final ReleaseEvent releaseEvent;
  const ReleaseEventDetailButtonBar({super.key, required this.releaseEvent});

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
          onPressed: () => {},
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          child: const Column(
            children:  [
              Icon(Icons.favorite),
              gapH4,
              Text('Like'),
            ],
          ),
        ),
        TextButton(
          key: shareBtnKey,
          onPressed: () => {},
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
        ),
        Consumer(builder: (context, ref, _) {
          return TextButton(
            key: infoBtnKey,
            onPressed: () {
              ref.read(urlLauncherProvider).launchReleaseEventMoreInfo(releaseEvent.id);
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
        }),
      ],
    );
  }
}
