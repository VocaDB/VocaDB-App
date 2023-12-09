import 'package:vocadb_app/src/features/pvs/domain/pv.dart';

class PVList {
  final List<PV> pvs;

  PVList(this.pvs);

  bool get isContainsYoutube =>
      pvs.any((pv) => pv.service.toLowerCase() == "youtube");

  List<PV> get originalPVs =>
      pvs.where((pv) => pv.pvType == 'Original').toList();

  List<PV> get otherPVs => pvs.where((pv) => pv.pvType != 'Original').toList();
}
