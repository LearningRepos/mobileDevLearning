// import 'dart:html';
import 'package:flutter/material.dart';

// when flutter runs, it starts at main => MaterialApp
void main() {
  runApp(
    MaterialApp(
      // removes the debug banner on top right
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[900],
          centerTitle: true,
          title: Text("I Am Rich"),
        ),
        body: Center(
          child: Image(
            image: AssetImage("images/diamond.png"),
          ),
        ),
      ),
    ),
  );
}
