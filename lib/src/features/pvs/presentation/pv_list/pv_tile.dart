import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:vocadb_app/src/features/pvs/domain/pv.dart';
import 'package:vocadb_app/src/utils/icon_site.dart';

/// A widget display simple information about PV as tile.
class PVTile extends StatelessWidget {
  final PV pv;

  final VoidCallback? onTap;

  final double iconSize;

  const PVTile({super.key, required this.pv, this.onTap, this.iconSize = 32});

  Widget buildLeading() {
    IconSite ic = IconSiteList.findIconAsset(pv.service);

    return SizedBox(
      width: iconSize,
      height: iconSize,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Image.asset(ic.assetName),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: buildLeading(),
      title: Text(pv.name, overflow: TextOverflow.ellipsis),
      subtitle: Text('${pv.service} • ${pv.pvType}'),
      onTap: onTap,
      trailing: PopupMenuButton<String>(
        onSelected: (String selectedValue) {
          if (selectedValue == 'share') {
            Share.share(pv.url);
          }
        },
        itemBuilder: (BuildContext context) => [
          const PopupMenuItem<String>(
            value: 'share',
            child: Text('Share'),
          ),
        ],
      ),
    );
  }
}
