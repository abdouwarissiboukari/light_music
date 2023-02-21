import 'package:light_music/models/Song.dart';

class MusicData {
  List<Song> allSong = [
    Song(
        id: 1,
        title: "Symphonie numéro 40",
        artist: "Betoven",
        imagePath: "un.jpg",
        urlSong: "allegro.mp3"),
    Song(
        id: 2,
        title: "New York State Of Mind - 2pac Feat Nas Jay-Z",
        artist: "2pac, Jay-Z",
        imagePath: "deux.jpg",
        urlSong: "New_York_State_Of_Mind.mp3"),
  ];
}
