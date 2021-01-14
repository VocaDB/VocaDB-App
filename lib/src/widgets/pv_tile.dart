import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:vocadb_app/utils.dart';

/// A widget display simple information about PV as tile.
class PVTile extends StatelessWidget {
  final String name;

  final String service;

  final String url;

  final String pvType;

  final VoidCallback onTap;

  final double iconSize;

  const PVTile(
      {Key key,
      this.name,
      this.service,
      this.url,
      this.pvType,
      this.onTap,
      this.iconSize = 32})
      : super(key: key);

  Widget buildLeading() {
    IconSite ic = IconSiteList.findIconAsset(this.service);

    return (ic == null)
        ? Icon(Icons.ondemand_video)
        : buildImageIcon(ic.assetName);
  }

  Widget buildImageIcon(String assetName) {
    return SizedBox(
      width: this.iconSize,
      height: this.iconSize,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Image.asset(assetName),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: buildLeading(),
      title: Text(this.name, overflow: TextOverflow.ellipsis),
      subtitle: Text('${this.service} • ${this.pvType}'),
      onTap: this.onTap,
      trailing: PopupMenuButton<String>(
        onSelected: (String selectedValue) {
          if (selectedValue == 'share') {
            Share.share(this.url);
          }
        },
        itemBuilder: (BuildContext context) => [
          PopupMenuItem<String>(
            value: 'share',
            child: Text('Share'),
          ),
        ],
      ),
    );
  }
}
