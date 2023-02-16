import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:light_music/models/MusicData.dart';
import 'package:light_music/models/Song.dart';
import 'package:light_music/services/DataProvider.dart';
import 'package:light_music/views/CustomImageView.dart';
import 'package:light_music/views/CustomTextView.dart';
import 'package:light_music/views/PlayerButton.dart';
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
    setupPlayer();
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
            children: [
              CustomImageView(imagePath: song.thumPath),
              CustomTextView(
                textValue: song.title,
                factor: 1.8,
                fontWeight: FontWeight.bold,
              ),
              CustomTextView(
                textValue: song.album,
                factor: 1.4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  PlayerButton(
                    onButtonPressed: onRewindPressed,
                    buttonIcon: Icons.fast_rewind_sharp,
                  ),
                  PlayerButton(
                    onButtonPressed: onPlayPausePressed,
                    buttonIcon: context.watch<DataProvider>().playPauseIcon,
                  ),
                  PlayerButton(
                    onButtonPressed: onForwardPressed,
                    buttonIcon: Icons.fast_forward_sharp,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  onPlayPausePressed() async {
    final state = audioPlayer.state;

    switch (state) {
      case PlayerState.completed:
        break;
      case PlayerState.stopped:
        setupPlayer();
        break;
      case PlayerState.paused:
        await audioPlayer.resume();
        break;
      case PlayerState.playing:
        await audioPlayer.pause();
        break;
    }
  }

  onRewindPressed() {
    song = onPreviousSong();
    clearPlayer();
    setupPlayer();
  }

  onForwardPressed() {
    clearPlayer();
    final newSong = onNextSong();
    song = newSong;
    setupPlayer();
  }

  Song onNextSong() {
    final index = songs.indexOf(song);
    return songs[(index < songs.length - 1) ? index + 1 : 0];
  }

  Song onPreviousSong() {
    final index = songs.indexOf(song);
    return songs[(index == 0) ? songs.length - 1 : index - 1];
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
      }
    }
  }

  Future<String> songPath() async {
    String string = "";
    audioCache = AudioCache();
    if (audioCache != null) {
      final uri = await audioCache!.load(song.urlPath);
      string = uri.toFilePath();
    }

    return string;
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
