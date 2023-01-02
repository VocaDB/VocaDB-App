import 'package:freezed_annotation/freezed_annotation.dart';

part 'web_link.freezed.dart';

part 'web_link.g.dart';

@freezed
class WebLink with _$WebLink {
  const factory WebLink({
    required int id,
    String? description,
    String? category,
    String? url,
  }) = _WebLink;

  factory WebLink.fromJson(Map<String, Object?> json) =>
      _$WebLinkFromJson(json);
}

extension WebLinkList on List<WebLink> {
  List<WebLink> get officialLinks =>
      where((link) => link.category != 'Reference').toList()
        ..sort((a, b) => a.description!.compareTo(b.description!));

  List<WebLink> get unofficialLinks =>
      where((link) => link.category == 'Reference').toList()
        ..sort((a, b) => a.description!.compareTo(b.description!));
}
