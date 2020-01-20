import 'package:flutter/material.dart';
import 'package:ihm_projet_mobilite/shared.dart';
import 'package:ihm_projet_mobilite/views/home_view.dart';
import 'package:ihm_projet_mobilite/views/map_view.dart';
import 'package:ihm_projet_mobilite/views/shopping_lists_view.dart';
import 'package:ihm_projet_mobilite/views/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String applicationName = 'Projet Mobilité';

    _asyncLoading();

    return MaterialApp(
      title: applicationName,
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashScreen(),
        SplashScreen.routeName: (context) => SplashScreen(),
        HomeView.routeName: (context) => HomeView(),
        MapView.routeName: (context) => MapView(),
        ShoppingListsView.routeName: (context) => ShoppingListsView(),
      },
    );
  }

  _asyncLoading() async {
    prefs = await SharedPreferences.getInstance();
  }
}
