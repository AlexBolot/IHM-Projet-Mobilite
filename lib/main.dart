import 'package:flutter/material.dart';
import 'package:ihm_projet_mobilite/views/front_view.dart';
import 'package:ihm_projet_mobilite/views/map_view.dart';

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
        '/': (context) => FrontView(),
        FrontView.routeName: (context) => FrontView(),
        MapView.routeName: (context) => MapView(),
      },
    );
  }
}
