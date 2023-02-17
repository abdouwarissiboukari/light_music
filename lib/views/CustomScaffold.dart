import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:light_music/main.dart';
import 'package:light_music/services/DataProvider.dart';
import 'package:light_music/views/CustomBody.dart';
import 'package:provider/provider.dart';

class CustomScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (context.watch<DataProvider>().osType)
        ? iOSScaffold()
        : androidScaffold();
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
