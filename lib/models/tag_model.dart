class TagModel {
  int id;
  String name;
  String categoryName;
  String additionalNames;
  String urlSlug;

  TagModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        categoryName = json['categoryName'],
        additionalNames = json['additionalNames'],
        urlSlug = json['urlSlug'];
}
