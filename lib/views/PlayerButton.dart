import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:light_music/services/DataProvider.dart';
import 'package:provider/provider.dart';

class PlayerButton extends StatelessWidget {
  IconData buttonIcon;
  Function() onButtonPressed;

  PlayerButton(
      {super.key, required this.onButtonPressed, required this.buttonIcon});

  @override
  Widget build(BuildContext context) {
    return (context.watch<DataProvider>().osType)
        ? iIconButton()
        : aIconButton();
  }

  IconButton aIconButton() {
    return IconButton(
      onPressed: onButtonPressed,
      icon: Icon(buttonIcon),
      iconSize: 50,
    );
  }

  CupertinoButton iIconButton() {
    return CupertinoButton(
      onPressed: onButtonPressed,
      // minSize: 50,
      child: Icon(
        buttonIcon,
        size: 50,
      ),
    );
  }
}
