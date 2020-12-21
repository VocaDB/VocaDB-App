import 'package:flutter/material.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/widgets.dart';

/// A widget for display artist browsing input
class ArtistInput extends StatelessWidget {
  /// Label input.
  final String label;

  /// Existing artist values
  final List<ArtistModel> values;

  /// Called when the user taps the deleteIcon.
  final Function(ArtistModel) onDeleted;

  /// Called when the user taps the add tag.
  final VoidCallback onAddPressed;

  final double imageSize;

  const ArtistInput(
      {this.label = 'Artists',
      this.values,
      this.onDeleted,
      this.onAddPressed,
      this.imageSize = 50});

  Widget _buildLeading(String imageUrl) {
    return SizedBox(
      width: this.imageSize,
      height: this.imageSize,
      child: ClipOval(
          child: Container(
        color: Colors.white,
        child:
            (imageUrl == null) ? Placeholder() : CustomNetworkImage(imageUrl),
      )),
    );
  }

  Widget _artistBuilder(ArtistModel artistModel) {
    return ListTile(
      leading: _buildLeading(artistModel.imageUrl),
      title: Text(artistModel.name),
      trailing: (this.onDeleted == null)
          ? null
          : IconButton(
              icon: Icon(Icons.close),
              onPressed: () => this.onDeleted(artistModel),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = [];

    items.add(ListTile(
      title: Text('Artists'),
    ));

    if (this.values != null && this.values.isNotEmpty) {
      items.addAll(this.values.map((e) => _artistBuilder(e)).toList());
    }

    if (this.onAddPressed != null) {
      items.add(ListTile(
        onTap: this.onAddPressed,
        leading: Icon(Icons.add),
        title: Text('ADD ARTIST'),
      ));
    }

    return Column(
      children: items,
    );
  }
}
