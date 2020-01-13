import 'package:flutter/material.dart';
import 'package:ihm_projet_mobilite/views/add_list_view.dart';
import 'package:ihm_projet_mobilite/views/home_view.dart';
import 'package:ihm_projet_mobilite/views/splash_screen.dart';
import 'package:ihm_projet_mobilite/views/map_view.dart';
import 'package:ihm_projet_mobilite/views/shopping_lists_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String applicationName = 'Projet Mobilité';

    return MaterialApp(
      title: applicationName,
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashScreen(),
        SplashScreen.routeName: (context) => SplashScreen(),
        HomeView.routeName: (context) => HomeView(),
        MapView.routeName: (context) => MapView(),
        ShoppingListsView.routeName: (context) => ShoppingListsView(),
        AddListView.routeName: (context) => AddListView(),
      },
    );
  }
}
