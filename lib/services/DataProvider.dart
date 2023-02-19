import 'package:flutter/material.dart';
import 'dart:io';

class DataProvider with ChangeNotifier {
  late IconData playPauseIcon;
  Duration position = const Duration(seconds: 0);
  Duration maxDuration = const Duration(seconds: 1);
  late bool osType;

  DataProvider() {
    getPlayPauseIcon(Icons.play_arrow);
    getOSType();
  }

  getOSType() {
    (Platform.isIOS) ? osType = true : osType = false;
    notifyListeners();
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
