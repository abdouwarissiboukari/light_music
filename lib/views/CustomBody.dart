import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:light_music/models/MusicData.dart';
import 'package:light_music/models/Song.dart';

class CustomBody extends StatefulWidget {
  @override
  CustomBodyState createState() => CustomBodyState();
}

class CustomBodyState extends State<CustomBody> {
  late Song song;
  late AudioPlayer audioPlayer;
  AudioCache? audioCache;
  List<Song> songs = MusicData().allSong;
  Duration position = const Duration(seconds: 0);
  Duration maxDuration = const Duration(seconds: 0);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [],
          ),
        ),
      ),
    );
  }

  Future<String> songPath() async {
    audioCache = AudioCache();
    final uri = await audioCache!.load(song.urlPath);

    return uri.toFilePath();
  }

  setupPlayer() async {
    audioPlayer = AudioPlayer();

    await audioPlayer.play(DeviceFileSource(await songPath()));
  }
}
