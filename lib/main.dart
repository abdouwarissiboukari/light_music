import 'package:flutter/material.dart';
import 'package:light_music/controller/MyApp.dart';
import 'package:light_music/services/DataProvider.dart';
import 'package:provider/provider.dart';

const Color appColor = Colors.deepOrange;
void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => DataProvider()),
    ],
    child: const MyApp(),
  ));
}
