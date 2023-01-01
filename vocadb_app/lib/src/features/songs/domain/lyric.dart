class Lyric {
  const Lyric({
    required this.id,
    required this.cultureCode,
    required this.source,
    required this.translationType,
    required this.url,
    required this.value,
  });

  final int id;

  final String cultureCode;

  final String source;

  final String translationType;

  final String url;

  final String value;
}
