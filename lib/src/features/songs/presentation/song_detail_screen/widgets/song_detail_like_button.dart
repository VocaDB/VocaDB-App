import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/constants/app_sizes.dart';
import 'package:vocadb_app/src/features/songs/domain/song.dart';
import 'package:vocadb_app/src/features/songs/presentation/song_detail_screen/song_detail_screen_controller.dart';
import 'package:vocadb_app/src/routing/app_route_context.dart';

class SongDetailLikeButton extends ConsumerWidget {
  const SongDetailLikeButton({super.key, required this.song});

  final Song song;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
        songDetailScreenControllerProvider(song.id)
            .select((value) => value.rating), (previous, next) {
      if (next.hasError) {
        context.goLogin();
      }
    });

    final value = ref.watch(ratingSongStateProvider(song.id));

    return value.when(
        loading: () => Container(),
        error: ((error, stackTrace) {
          return Container();
        }),
        data: (data) {
          if (data == null || data == 'Nothing') {
            return UnratedButton(onTap: (val) {
              ref
                  .read(songDetailScreenControllerProvider(song.id).notifier)
                  .updateRateSong(val);
            });
          }

          return RatedButton(
            value: data,
            onPressed: () {
              ref
                  .read(songDetailScreenControllerProvider(song.id).notifier)
                  .onTapCancelLikeButton();
            },
          );
        });
  }
}

class RatedButton extends StatelessWidget {
  const RatedButton({super.key, required this.value, required this.onPressed});

  final String value;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return (value == 'Like')
        ? LikeButton(
            onPressed: onPressed,
            active: true,
          )
        : FavoriteButton(
            onPressed: onPressed,
            active: true,
          );
  }
}

class UnratedButton extends StatelessWidget {
  const UnratedButton({super.key, required this.onTap});

  final Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      itemBuilder: ((context) => <PopupMenuEntry<String>>[
            PopupMenuItem<String>(
              value: 'Like',
              child: const ListTile(
                leading: Icon(Icons.thumb_up),
                title: Text('Like'),
              ),
              onTap: () => onTap('Like'),
            ),
            PopupMenuItem<String>(
              value: 'Favorite',
              child: const ListTile(
                leading: Icon(Icons.favorite),
                title: Text('Favorite'),
              ),
              onTap: () => onTap('Favorite'),
            ),
          ]),
      child: Column(
        children: const [
          Icon(Icons.thumb_up),
          gapH4,
          Text('Like'),
        ],
      ),
    );
  }
}

class LikeButton extends StatelessWidget {
  const LikeButton({super.key, this.active = false, required this.onPressed});

  final VoidCallback onPressed;

  final bool active;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(
            (active) ? Colors.blueAccent : Colors.white),
      ),
      child: Column(
        children: const [
          Icon(Icons.thumb_up),
          gapH4,
          Text('Like'),
        ],
      ),
    );
  }
}

class FavoriteButton extends StatelessWidget {
  const FavoriteButton(
      {super.key, this.active = false, required this.onPressed});

  final VoidCallback onPressed;

  final bool active;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(
            (active) ? Colors.pinkAccent : Colors.white),
      ),
      child: Column(
        children: const [
          Icon(Icons.favorite),
          gapH4,
          Text('Favorite'),
        ],
      ),
    );
  }
}
