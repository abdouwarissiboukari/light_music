import 'package:flutter/material.dart';

class DataProvider with ChangeNotifier {
  late IconData playPauseIcon;
  Duration position = const Duration(seconds: 0);
  Duration maxDuration = const Duration(seconds: 0);

  DataProvider() {
    getPlayPauseIcon(Icons.play_arrow);
  }

  getPlayPauseIcon(IconData iconData) {
    playPauseIcon = iconData;

    notifyListeners();
  }

  onDurationChanged(Duration duration) {
    maxDuration = duration;
    notifyListeners();
  }

  onPositionChanged(Duration newPosition) {
    position = newPosition;
    notifyListeners();
  }
}
