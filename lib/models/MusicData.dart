import 'package:light_music/models/Song.dart';

class MusicData {
  List<Song> allSong = [
    Song(
        id: 1,
        title: "Symphonie numéro 40",
        album: "Best of",
        thumb: "un.jpg",
        urlPath: "allegro.mp3"),
    Song(
        id: 2,
        title: "New York State Of Mind - 2pac Feat Nas Jay-Z",
        album: "Duets",
        thumb: "deux.jpg",
        urlPath: "New_York_State_Of_Mind.mp3"),
  ];
}
