import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:light_music/main.dart';
import 'package:light_music/services/DataProvider.dart';
import 'package:light_music/views/CustomTextView.dart';
import 'package:provider/provider.dart';

class DurationSliderView extends StatelessWidget {
  Function(double) onPositionChanged;

  DurationSliderView({super.key, required this.onPositionChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 7, right: 7),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              CustomTextView(
                textValue:
                    readableDuration(context.watch<DataProvider>().position),
              ),
              CustomTextView(
                textValue:
                    readableDuration(context.watch<DataProvider>().maxDuration),
              ),
            ],
          ),
          (context.watch<DataProvider>().osType)
              ? iSlider(context)
              : aSlider(context),
        ],
      ),
    );
  }

  CupertinoSlider iSlider(BuildContext context) {
    final pos = context.watch<DataProvider>().position.inSeconds.toDouble();
    return CupertinoSlider(
      min: 0,
      max: context.watch<DataProvider>().maxDuration.inSeconds.toDouble(),
      value:
          pos, // context.watch<DataProvider>().position.inSeconds.toDouble(),
      onChanged: onPositionChanged,
      activeColor: appColor,
    );
  }

  Slider aSlider(BuildContext context) {
    return Slider(
      min: 0,
      max: context.watch<DataProvider>().maxDuration.inSeconds.toDouble(),
      value: context.watch<DataProvider>().position.inSeconds.toDouble(),
      onChanged: onPositionChanged,
      activeColor: appColor,
    );
  }

  String readableDuration(Duration duration) {
    int heures = duration.inHours.remainder(24);
    int minutes = duration.inMinutes.remainder(60);
    int secondes = duration.inSeconds.remainder(60);
    String heuresStr = (heures < 10) ? "0$heures" : heures.toString();
    String minutesStr = (minutes < 10) ? "0$minutes" : minutes.toString();
    String secondesStr = (secondes < 10) ? "0$secondes" : secondes.toString();

    return "$heuresStr : $minutesStr : $secondesStr";
  }
}
