import 'package:flutter/material.dart';

class CustomImageView extends StatelessWidget {
  final String imagePath;

  const CustomImageView({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.width * 0.7,
      width: size.width * 0.7,
      child: Card(
        elevation: 10,
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
