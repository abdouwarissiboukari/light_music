import 'package:flutter/material.dart';
import 'package:light_music/views/CustomMaterialApp.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CustomMaterialApp(
        isiOS: (Theme.of(context).platform == TargetPlatform.iOS));
  }
}
