class Song {
  int id;
  String title;
  String artist;
  String imagePath;
  String urlSong;

  Song(
      {required this.id,
      required this.title,
      required this.artist,
      required this.imagePath,
      required this.urlSong});

  String get getImagePath => "assets/$imagePath";
}
