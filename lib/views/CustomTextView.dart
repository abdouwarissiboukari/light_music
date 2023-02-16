import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextView extends StatelessWidget {
  String textValue;
  double factor;
  FontWeight fontWeight;

  CustomTextView({
    super.key,
    required this.textValue,
    this.factor = 1.0,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textValue,
      textScaleFactor: factor,
      style: GoogleFonts.signika(
        fontWeight: fontWeight,
      ),
    );
  }
}
