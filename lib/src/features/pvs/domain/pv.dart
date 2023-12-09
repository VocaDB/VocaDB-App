import 'package:freezed_annotation/freezed_annotation.dart';

part 'pv.freezed.dart';
part 'pv.g.dart';

@freezed
class PV with _$PV {
  factory PV({
    required int id,
    required String name,
    required String service,
    required String pvType,
    required String url,
  }) = _PV;

  factory PV.fromJson(Map<String, dynamic> json) => _$PVFromJson(json);
}
