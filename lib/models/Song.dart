class Song {
  int id;
  String title;
  String album;
  String thumb;
  String urlPath;

  Song({
    required this.id,
    required this.title,
    required this.album,
    required this.thumb,
    required this.urlPath,
  });

  String get thumPath => "/assest/$thumb";
}
