import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';

class AppNameWidget extends StatelessWidget {
  final double fontSize;

  const AppNameWidget({
    super.key,
    this.fontSize = 30,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: TextStyle(
          fontSize: fontSize,
        ),
        children: [
          const TextSpan(
            text: 'Green',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          TextSpan(
            text: 'grocer',
            style: TextStyle(
              color: CustomColors.customContrastColor,
            ),
          ),
        ],
      ),
    );
  }
}
