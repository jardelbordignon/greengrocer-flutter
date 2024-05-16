import 'package:flutter/material.dart';

// Map<int, Color> _swatchColors = {
//   50: const Color(0xFFE8F5E9),
//   100: const Color(0xFFC8E6C9),
//   200: const Color(0xFFA5D6A7),
//   300: const Color(0xFF81C784),
//   400: const Color(0xFF66BB6A),
//   500: const Color(0xFF4CAF50),
//   600: const Color(0xFF43A047),
//   700: const Color(0xFF388E3C),
//   800: const Color(0xFF2E7D32),
//   900: const Color(0xFF1B5E20),
// };

Map<int, Color> _swatchColors = {
  50: const Color.fromRGBO(139, 195, 74, .1),
  100: const Color.fromRGBO(139, 195, 74, .2),
  200: const Color.fromRGBO(139, 195, 74, .3),
  300: const Color.fromRGBO(139, 195, 74, .4),
  400: const Color.fromRGBO(139, 195, 74, .5),
  500: const Color.fromRGBO(139, 195, 74, .6),
  600: const Color.fromRGBO(139, 195, 74, .7),
  700: const Color.fromRGBO(139, 195, 74, .8),
  800: const Color.fromRGBO(139, 195, 74, .9),
  900: const Color.fromRGBO(139, 195, 74, 1),
};

abstract class CustomColors {
  static Color customContrastColor = Colors.grey.shade700;
  static MaterialColor customSwatchColor =
      MaterialColor(0xFF8BC34A, _swatchColors);
}
