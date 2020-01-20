import 'package:flutter/material.dart';

/// Returns the adequate text color to contrast with a given [background] Color
Color contrastOf(Color background) {
  var brightness = ThemeData.estimateBrightnessForColor(background);
  return brightness == Brightness.light ? Colors.black : Colors.white;
}