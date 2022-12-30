import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/simple_dropdown_input.dart';
import 'package:vocadb_app/src/features/artists/presentation/artist_input/artist_input.dart';
import 'package:vocadb_app/src/features/tags/presentation/tag_widgets/tag_input.dart';

// TODO : need implementation
class UserAlbumsFilterScreen extends StatelessWidget {
  const UserAlbumsFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter'),
      ),
      body: ListView(
        children: [
          SimpleDropdownInput(
            value: '',
            label: 'Collection status',
            onChanged: (value) {},
            items: const [
              SimpleDropdownItem(name: 'Anything', value: ''),
              SimpleDropdownItem(name: 'Wishlisted', value: 'Wishlisted'),
              SimpleDropdownItem(name: 'Ordered', value: 'Ordered'),
              SimpleDropdownItem(name: 'Owned', value: 'Owned'),
              SimpleDropdownItem(name: 'All', value: 'All'),
            ],
          ),
          SimpleDropdownInput(
            value: 'Unknown',
            label: 'Album type',
            onChanged: (value) {},
            items: const [
              SimpleDropdownItem(name: 'Not specified', value: 'Unknown'),
              SimpleDropdownItem(name: 'Original album', value: 'Album'),
              SimpleDropdownItem(name: 'E.P.', value: 'EP'),
              SimpleDropdownItem(name: 'Split album', value: 'SplitAlbum'),
              SimpleDropdownItem(name: 'Compilation', value: 'Compilation'),
              SimpleDropdownItem(name: 'Video', value: 'Video'),
              SimpleDropdownItem(name: 'Artbook', value: 'Artbook'),
              SimpleDropdownItem(name: 'Game', value: 'Game'),
              SimpleDropdownItem(name: 'Fanmade', value: 'Fanmade'),
              SimpleDropdownItem(name: 'Instrumental', value: 'Instrumental'),
              SimpleDropdownItem(name: 'Other', value: 'Other'),
            ],
          ),
          // PhysicalDisc, DigitalDownload, Other
          SimpleDropdownInput(
            value: '',
            label: 'Media type',
            onChanged: (value) {},
            items: const [
              SimpleDropdownItem(name: 'Anything', value: ''),
              SimpleDropdownItem(name: 'Physical disc', value: 'PhysicalDisc'),
              SimpleDropdownItem(
                  name: 'Digital download', value: 'DigitalDownload'),
              SimpleDropdownItem(name: 'Unpsecified', value: 'Other'),
            ],
          ),
          const Divider(),
          const ArtistInput(),
          const Divider(),
          const TagInput(),
        ],
      ),
    );
  }
}
