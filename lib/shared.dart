import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Returns the adequate text color to contrast with a given [background] Color
Color contrastOf(Color background) {
  var brightness = ThemeData.estimateBrightnessForColor(background);
  return brightness == Brightness.light ? Colors.black : Colors.white;
}

SharedPreferences prefs;

List<String> shops = new List();

String selectedShop;
