import 'package:flutter/material.dart';

import "package:clima/services/location.dart";

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location location = new Location();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            location.getCurrentLocation();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
