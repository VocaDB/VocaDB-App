import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vocadb/models/pv_model.dart';
import 'package:vocadb/utils/icon_site.dart';

class PVTile extends StatelessWidget {
  final PVModel pv;

  const PVTile({Key key, this.pv}) : super(key: key);

  Widget buildLeading() {
    IconSite ic = IconSiteList.findIconAsset(pv.service);

    return (ic == null)
        ? Icon(Icons.ondemand_video)
        : buildImageIcon(ic.assetName);
  }

  Widget buildImageIcon(String assetName) {
    return SizedBox(
      width: 32,
      height: 32,
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
      title: Text(pv.name, overflow: TextOverflow.ellipsis),
      subtitle: Text('${pv.service} • ${pv.pvType}'),
      onTap: () {
        launch(pv.url);
      },
      trailing: PopupMenuButton<String>(
        onSelected: (String selectedValue) {
          if (selectedValue == 'share') {
            Share.share(pv.url);
          }
        },
        itemBuilder: (BuildContext context) => [
          PopupMenuItem<String>(
            value: 'share',
            child: Text(FlutterI18n.translate(context, 'label.share')),
          ),
        ],
      ),
    );
  }
}
