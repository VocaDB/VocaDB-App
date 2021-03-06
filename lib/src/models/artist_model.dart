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

  ArtistModel.fromEntry(EntryModel entry)
      : super(
            id: entry.id,
            name: entry.name,
            artistString: entry.artistString,
            songType: entry.songType,
            mainPicture: entry.mainPicture,
            discType: entry.discType,
            eventCategory: entry.eventCategory,
            artistType: entry.artistType,
            entryType: EntryType.Artist);

  ArtistModel(
      {int id, String name, String artistType, MainPictureModel mainPicture})
      : super(
            id: id,
            name: name,
            mainPicture: mainPicture,
            artistType: artistType,
            entryType: EntryType.Artist);

  String get originUrl => '$baseUrl/Ar/${this.id}';

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
