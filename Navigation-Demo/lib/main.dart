import 'package:flutter/material.dart';
import 'screen0.dart';
import 'screen1.dart';
import "screen0.dart";
import 'screen1.dart';
import 'screen2.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => Screen0(),
        "/1": (context) => Screen1(),
        "/2": (context) => Screen2(),
      },
    );
  }
}
