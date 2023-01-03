import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vocadb_app/src/constants/config.dart';
import 'package:vocadb_app/src/features/artists/domain/artist.dart';

part 'artist_role.freezed.dart';
part 'artist_role.g.dart';

@freezed
class ArtistRole with _$ArtistRole {
  factory ArtistRole({
    int? id,
    String? name,
    String? categories,
    @Default('Default') String effectiveRoles,
    @Default('Default') String roles,
    Artist? artist,
  }) = _ArtistRole;

  factory ArtistRole.fromJson(Map<String, dynamic> json) =>
      _$ArtistRoleFromJson(json);
}

extension ArtistRoleExtended on ArtistRole {
  String get artistRole =>
      (categories! == 'Other') ? effectiveRoles : categories!;

  bool get isProducer => (categories == 'Producer');

  bool get isVocalist => (categories == 'Vocalist');

  bool get isCircle => (categories == 'Circle');

  bool get isLabel => (categories == 'Label');

  bool get isOtherRole => (!isProducer && !isVocalist);

  /// Get image of artist. Return placeholder image if `artist` is null.
  String get imageUrl {
    if (artist == null) {
      return kPlaceholderImageUrl;
    }

    return artist!.imageUrl ?? kPlaceholderImageUrl;
  }

  /// Get name of artist. Return `name` if `artist` is null.
  String? get artistName {
    if (artist == null) {
      return name;
    }

    return artist!.name;
  }

  /// Get type of artist
  String? get artistType {
    if (artist == null) {
      return categories;
    }

    return artist!.artistType;
  }
}

extension ArtistsByRole on List<ArtistRole> {
  List<ArtistRole> get producers => where((e) => e.isProducer).toList();
  List<ArtistRole> get vocalists => where((e) => e.isVocalist).toList();
  List<ArtistRole> get circles => where((e) => e.isVocalist).toList();
  List<ArtistRole> get labels => where((e) => e.isLabel).toList();
}
