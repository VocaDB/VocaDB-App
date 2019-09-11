class MainPicture {
  String meme;
  String urlSmallThumb;
  String urlThumb;
  String urlTinyThumb;

  MainPicture.fromJson(Map<String, dynamic> json) :
    meme = json['meme'],
    urlSmallThumb = json['urlSmallThumb'],
    urlThumb = json['urlThumb'],
    urlTinyThumb = json['urlTinyThumb'];
}