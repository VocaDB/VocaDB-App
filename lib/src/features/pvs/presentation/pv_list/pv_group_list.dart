import 'package:flutter/material.dart';
import 'package:vocadb_app/src/features/pvs/domain/pv.dart';
import 'package:vocadb_app/src/features/pvs/domain/pv_list.dart';
import 'package:vocadb_app/src/features/pvs/presentation/pv_list/pv_tile.dart';
import 'package:vocadb_app/src/features/weblinks/presentation/site_tile.dart';

/// A widget display list of pvs grouping by category
class PVGroupList extends StatelessWidget {
  final List<PV> pvs;

  /// For pv list that not contains any Youtube pv.
  final String searchQuery;

  final Function(PV)? onTap;

  const PVGroupList({
    super.key,
    required this.pvs,
    this.onTap,
    required this.searchQuery,
  });

  List<Widget> _generateItems() {
    List<Widget> items = [];

    PVList pvList = PVList(pvs);

    List<PV> originalPVs = pvList.originalPVs;
    List<PV> otherPVs = pvList.otherPVs;

    if (originalPVs.isNotEmpty) {
      items.add(const ListTile(
        title: Text('Original'),
      ));
      items.addAll(originalPVs.map(_mapPVTile));
    }

    if (otherPVs.isNotEmpty) {
      items.add(const ListTile(
        title: Text('Others'),
      ));
      items.addAll(otherPVs.map(_mapPVTile));
    }

    if (!pvList.isContainsYoutube) {
      if (otherPVs.isEmpty) {
        items.add(const ListTile(
          title: Text('Others'),
        ));
      }

      items.add(SiteTile(
        title: 'searchYoutube',
        url: 'https://www.youtube.com/results?search_query=$searchQuery',
      ));
    }

    return items;
  }

  PVTile _mapPVTile(PV pv) {
    return PVTile(
      pv: pv,
      onTap: () => onTap!(pv),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _generateItems(),
    );
  }
}
