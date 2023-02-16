import 'package:flutter/material.dart';

class PlayerButton extends StatelessWidget {
  IconData buttonIcon;
  Function() onButtonPressed;

  PlayerButton(
      {super.key, required this.onButtonPressed, required this.buttonIcon});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onButtonPressed,
      icon: Icon(buttonIcon),
      iconSize: 50,
    );
  }
}
