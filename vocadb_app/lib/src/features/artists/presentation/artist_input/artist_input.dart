import 'package:flutter/material.dart';
import 'package:vocadb_app/src/common_widgets/custom_network_image.dart';
import 'package:vocadb_app/src/features/artists/domain/artist.dart';

/// A widget for display artist browsing input
class ArtistInput extends StatelessWidget {
  /// Label input.
  final String label;

  /// Existing artist values
  final List<Artist> values;

  /// Called when the user taps the deleteIcon.
  final Function(Artist)? onDeleted;

  /// Called when select artist
  final Function(Artist)? onSelect;

  final double imageSize;

  const ArtistInput({
    this.label = 'Artists',
    this.values = const [],
    this.onDeleted,
    this.onSelect,
    this.imageSize = 50,
  });

  Widget _buildLeading(String imageUrl) {
    return SizedBox(
      width: imageSize,
      height: imageSize,
      child: ClipOval(
          child: Container(
        color: Colors.white,
        child: (imageUrl == null)
            ? const Placeholder()
            : CustomNetworkImage(imageUrl),
      )),
    );
  }

  Widget _artistBuilder(Artist artist) {
    return ListTile(
      leading: _buildLeading(artist.imageUrl!),
      title: Text(artist.name!),
      trailing: (onDeleted == null)
          ? null
          : IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                if (onDeleted != null) {
                  onDeleted!(artist);
                }
              },
            ),
    );
  }

  void _onBrowse() {
    //TODO Implement browse
  }

  void _postBrowse(value) {
    if (value != null) {
      //TODO Implement post browse
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = [];

    items.add(const ListTile(
      title: Text('Artists'),
    ));

    if (values.isNotEmpty) {
      items.addAll(values.map((e) => _artistBuilder(e)).toList());
    }

    items.add(ListTile(
      onTap: _onBrowse,
      leading: const Icon(Icons.add),
      title: const Text('Add'),
    ));

    return Column(
      children: items,
    );
  }
}
