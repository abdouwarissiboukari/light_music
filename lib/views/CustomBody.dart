import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:light_music/models/MusicData.dart';
import 'package:light_music/models/Song.dart';
import 'package:light_music/services/DataProvider.dart';
import 'package:provider/provider.dart';

class CustomBody extends StatefulWidget {
  @override
  CustomBodyState createState() => CustomBodyState();
}

class CustomBodyState extends State<CustomBody> {
  late Song song;
  late AudioPlayer audioPlayer;
  AudioCache? audioCache;
  List<Song> songs = MusicData().allSong;
  bool listenerState = true;

  @override
  void initState() {
    super.initState();
    song = songs.first;
  }

  @override
  void dispose() {
    listenerState = false;
    clearPlayer();
    super.dispose();
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

  onPlayPausePressed() async {
    final state = audioPlayer.state;
  }

  onRewindPressed() {
    onPreviousSong();
    clearPlayer();
    setupPlayer();
  }

  onForwardPressed() {
    onNextSong();
    clearPlayer();
    setupPlayer();
  }

  onNextSong() {
    final index = songs.indexOf(song);
    song = songs[(index < songs.length - 1) ? index + 1 : 0];
  }

  onPreviousSong() {
    final index = songs.indexOf(song);
    song = songs[(index == 0) ? songs.length - 1 : index - 1];
  }

  onStateChanged(PlayerState state) {
    if (listenerState) {
      switch (state) {
        case PlayerState.completed:
          onForwardPressed();
          break;
        case PlayerState.playing:
          context.read<DataProvider>().getPlayPauseIcon(Icons.pause);
          break;
        case PlayerState.paused:
          context.read<DataProvider>().getPlayPauseIcon(Icons.play_arrow);
          break;
        case PlayerState.stopped:
          context.read<DataProvider>().getPlayPauseIcon(Icons.play_arrow);
          break;
        default:
      }
    }
  }

  Future<String> songPath() async {
    audioCache = AudioCache();
    final uri = await audioCache!.load(song.urlPath);

    return uri.toFilePath();
  }

  setupPlayer() async {
    audioPlayer = AudioPlayer();
    audioPlayer.onPlayerStateChanged.listen(onStateChanged);
    audioPlayer.onDurationChanged
        .listen(context.read<DataProvider>().onDurationChanged);
    audioPlayer.onPositionChanged
        .listen(context.read<DataProvider>().onPositionChanged);
    await audioPlayer.play(DeviceFileSource(await songPath()));
  }

  clearPlayer() {
    audioPlayer.release();
    audioPlayer.dispose();
    if (audioCache != null) {
      audioCache!.clearAll();
      audioCache = null;
    }
  }
}
