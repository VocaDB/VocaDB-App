import 'package:intl/intl.dart';
import 'package:vocadb_app/constants.dart';
import 'package:vocadb_app/models.dart';
import 'package:vocadb_app/utils.dart';

class ArtistModel extends EntryModel {
  String additionalNames;
  String releaseDate;
  String description;
  ArtistRelations relations;
  ArtistModel baseVoicebank;
  List<ArtistLinkModel> artistLinksReverse;
  List<ArtistLinkModel> artistLinks;

  ArtistModel.fromJson(Map<String, dynamic> json)
      : additionalNames = json['additionalNames'],
        description = json['description'],
        releaseDate = json['releaseDate'],
        relations = (json.containsKey('relations'))
            ? ArtistRelations.fromJson(json['relations'] ?? {})
            : null,
        baseVoicebank = (json.containsKey('baseVoicebank') &&
                !(json['baseVoicebank'] is int))
            ? ArtistModel.fromJson(json['baseVoicebank'])
            : null,
        artistLinks = JSONUtils.mapJsonArray<ArtistLinkModel>(
            json['artistLinks'],
            (v) => (v is int) ? null : ArtistLinkModel.fromJson(v)),
        artistLinksReverse = JSONUtils.mapJsonArray<ArtistLinkModel>(
            json['artistLinksReverse'],
            (v) => (v is int) ? null : ArtistLinkModel.fromJson(v)),
        super.fromJson(json, entryType: EntryType.Artist);

  ArtistModel({int id, String name, MainPictureModel mainPicture})
      : super(
            id: id,
            name: name,
            mainPicture: mainPicture,
            entryType: EntryType.Artist);

  static List<ArtistModel> jsonToList(List items) {
    return items.map((i) => ArtistModel.fromJson(i)).toList();
  }

  String get releaseDateFormatted => (releaseDate == null)
      ? null
      : DateFormat('yyyy-MM-dd').format(DateTime.parse(releaseDate));

  String get imageUrl => '$baseUrl/Artist/Picture/$id';

  List<ArtistModel> get voiceProviders => this
      .artistLinks
      .where((a) => a.linkType == 'VoiceProvider')
      .map<ArtistModel>((a) => a.artist)
      .toList();

  List<ArtistModel> get illustrators => this
      .artistLinks
      .where((a) => a.linkType == 'Illustrator')
      .map<ArtistModel>((a) => a.artist)
      .toList();

  List<ArtistModel> get groups => this
      .artistLinks
      .where((a) => a.linkType == 'Group')
      .map<ArtistModel>((a) => a.artist)
      .toList();

  List<ArtistModel> get voiceProvidedList => this
      .artistLinksReverse
      .where((a) => a.linkType == 'VoiceProvider')
      .map<ArtistModel>((a) => a.artist)
      .toList();

  List<ArtistModel> get illustratedList => this
      .artistLinksReverse
      .where((a) => a.linkType == 'Illustrator')
      .map<ArtistModel>((a) => a.artist)
      .toList();

  List<ArtistModel> get members => this
      .artistLinksReverse
      .where((a) => a.linkType == 'Group')
      .map<ArtistModel>((a) => a.artist)
      .toList();

  List<TagModel> get tags =>
      (this.tagGroups != null) ? this.tagGroups.map((t) => t.tag).toList() : [];

  bool get isContainsDetail =>
      ((description != null && description.isNotEmpty) ||
          artistLinksReverse.isNotEmpty ||
          artistLinks.isNotEmpty ||
          (releaseDate != null && releaseDate.isNotEmpty));
}
