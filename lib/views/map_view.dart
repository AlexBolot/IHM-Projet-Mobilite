import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ihm_projet_mobilite/views/front_view.dart';

class MapView extends StatefulWidget {
  static const String routeName = "/MapView";

  final String title;

  const MapView({this.title = 'Magasin'});

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  child: Text(
                    'Easy Shopping',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      letterSpacing: 2,
                    ),
                  ),
                ),
                Container(height: 25),
                Container(
                  child: Text(
                    "Faire  shopping n'a jamais été aussi simple ",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            Container(
              child: RaisedButton(
                child: Text('Commencer'),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(FrontView.routeName);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
