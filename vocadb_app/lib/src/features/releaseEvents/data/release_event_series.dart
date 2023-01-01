// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:vocadb_app/src/features/entries/domain/main_picture.dart';
import 'package:vocadb_app/src/features/releaseEvents/data/release_event.dart';
import 'package:vocadb_app/src/features/weblinks/domain/web_link.dart';

class ReleaseEventSeries {
  final int id;

  final String? name;

  final String? additionalNames;

  final String? description;

  final String? category;

  final List<ReleaseEvent?>? events;

  final MainPicture? mainPicture;

  final List<WebLink?>? webLinks;
  ReleaseEventSeries({
    required this.id,
    this.name,
    this.additionalNames,
    this.description,
    this.category,
    this.events,
    this.mainPicture,
    this.webLinks,
  });
}
