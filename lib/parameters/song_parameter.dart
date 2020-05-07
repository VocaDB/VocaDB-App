class SongParameter {
  final String query;
  final String fields;
  final String lang;

  SongParameter({this.query, this.fields, this.lang = "Default"});

  Map<String, String> toMap() {
    return {'query': this.query, 'fields': this.fields, 'lang': this.lang};
  }
}
