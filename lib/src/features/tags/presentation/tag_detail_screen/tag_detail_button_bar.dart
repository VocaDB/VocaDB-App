import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/constants/app_sizes.dart';
import 'package:vocadb_app/src/features/tags/domain/tag.dart';
import 'package:vocadb_app/src/utils/share_launcher.dart';
import 'package:vocadb_app/src/utils/url_launcher.dart';

class TagDetailButtonBar extends StatelessWidget {
  final Tag tag;

  const TagDetailButtonBar({super.key, required this.tag});

  static const addBtnKey = Key('add-btn-key');
  static const shareBtnKey = Key('share-btn-key');
  static const infoBtnKey = Key('info-btn-key');

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.spaceEvenly,
      children: [
        Consumer(builder: (context, ref, _) {
          return TextButton(
            key: shareBtnKey,
            onPressed: () => ref.read(shareLauncherProvider).shareTag(tag.id),
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
              ref.read(urlLauncherProvider).launchTagMoreInfo(tag.id);
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
