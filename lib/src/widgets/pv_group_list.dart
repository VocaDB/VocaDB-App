import 'package:flutter/material.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/widgets.dart';
import 'package:get/get.dart';

/// A widget display list of pvs grouping by category
class PVGroupList extends StatelessWidget {
  final List<PVModel> pvs;

  /// For pv list that not contains any Youtube pv.
  final searchQuery;

  final Function(PVModel) onTap;

  const PVGroupList({@required this.pvs, this.onTap, this.searchQuery})
      : assert(pvs != null);

  List<Widget> _generateItems() {
    List<Widget> items = [];

    PVList pvList = PVList(pvs);

    List<PVModel> originalPVs = pvList.originalPVs;
    List<PVModel> otherPVs = pvList.otherPVs;

    if (originalPVs.isNotEmpty) {
      items.add(ListTile(
        title: Text('originalMedia'.tr),
      ));
      items.addAll(originalPVs.map(_mapPVTile));
    }

    if (otherPVs.isNotEmpty) {
      items.add(ListTile(
        title: Text('otherMedia'.tr),
      ));
      items.addAll(otherPVs.map(_mapPVTile));
    }

    if (!pvList.isContainsYoutube) {
      if (otherPVs.isEmpty) {
        items.add(ListTile(
          title: Text('otherMedia'.tr),
        ));
      }

      items.add(SiteTile(
        title: 'searchYoutube'.tr,
        url: 'https://www.youtube.com/results?search_query=$searchQuery',
      ));
    }

    return items;
  }

  PVTile _mapPVTile(PVModel model) {
    return PVTile(
      name: model.name,
      service: model.service,
      url: model.url,
      pvType: model.pvType,
      onTap: () => this.onTap(model),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _generateItems(),
    );
  }
}
