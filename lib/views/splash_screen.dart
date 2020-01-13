import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ihm_projet_mobilite/views/home_view.dart';
import 'package:ihm_projet_mobilite/views/map_view.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "/SplashScreen";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
                    "Faire son shopping n'a jamais été aussi simple ",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            Container(
              child: RaisedButton(
                child: Text('Commencer'),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(HomeView.routeName);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
