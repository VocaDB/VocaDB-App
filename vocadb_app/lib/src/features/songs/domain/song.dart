class Song {
  const Song({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.artistString,
    required this.songType,
    this.pvServices = '',
  });

  final String id;
  final String name;
  final String artistString;
  final String imageUrl;
  final String songType;
  final String pvServices;
}
