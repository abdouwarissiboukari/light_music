import 'package:flutter/material.dart';
import 'package:light_music/views/CustomScaffold.dart';

class Home extends StatefulWidget {
  final bool isiOS;

  const Home({super.key, required this.isiOS});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(isiOS: widget.isiOS);
  }
}
