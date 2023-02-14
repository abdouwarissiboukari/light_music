import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:light_music/main.dart';
import 'package:light_music/views/CustomBody.dart';

class CustomScaffold extends StatelessWidget {
  final bool isiOS;

  const CustomScaffold({
    super.key,
    required this.isiOS,
  });

  @override
  Widget build(BuildContext context) {
    return (isiOS) ? iOSScaffold() : androidScaffold();
  }

  Text appTitle() => const Text(
        "Light Music",
      );

  CupertinoPageScaffold iOSScaffold() {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          brightness: Brightness.light,
          middle: appTitle(),
        ),
        child: CustomBody());
  }

  Scaffold androidScaffold() {
    return Scaffold(
      appBar: AppBar(
        title: appTitle(),
        centerTitle: true,
        elevation: 10,
      ),
      body: CustomBody(),
    );
  }
}
