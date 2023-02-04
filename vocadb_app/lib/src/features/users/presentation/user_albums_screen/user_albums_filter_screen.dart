import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocadb_app/src/features/albums/presentation/widgets/dropdown_album_type.dart';
import 'package:vocadb_app/src/features/artists/presentation/artist_input/artist_input.dart';
import 'package:vocadb_app/src/features/tags/presentation/tag_widgets/tag_input.dart';
import 'package:vocadb_app/src/features/users/presentation/user_albums_screen/user_albums_list_params_state.dart';

class UserAlbumsFilterScreen extends StatelessWidget {
  const UserAlbumsFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter'),
      ),
      body: Consumer(
        builder: ((context, ref, child) {
          final state = ref.watch(userAlbumsListParamsStateProvider);
          return ListView(
            children: [
              DropdownAlbumType(
                value: state.albumTypes,
                onChanged: (value) => ref
                    .read(userAlbumsListParamsStateProvider.notifier)
                    .updateAlbumTypes(value!),
              ),
              const Divider(),
              const ArtistInput(),
              const Divider(),
              const TagInput(),
            ],
          );
        }),
      ),
    );
  }
}
