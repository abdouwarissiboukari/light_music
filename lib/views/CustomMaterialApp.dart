import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:light_music/controller/Home.dart';
import 'package:light_music/main.dart';

class CustomMaterialApp extends StatelessWidget {
  final bool isiOS;

  const CustomMaterialApp({super.key, required this.isiOS});

  @override
  Widget build(BuildContext context) {
    return (isiOS) ? iOSMaterialApp() : androidMaterialApp();
  }

  CupertinoApp iOSMaterialApp() {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: const CupertinoThemeData(
        primaryColor: appColor,
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('fr', ''),
        Locale('en', ''),
      ],
      home: Home(isiOS: isiOS),
    );
  }

  MaterialApp androidMaterialApp() {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        primaryColor: appColor,
        appBarTheme: AppBarTheme(
          backgroundColor: appColor,
          centerTitle: true,
          titleTextStyle: GoogleFonts.signika(
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      darkTheme: ThemeData.dark(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('fr', ''),
        Locale('en', ''),
      ],
      home: Home(isiOS: isiOS),
    );
  }
}
