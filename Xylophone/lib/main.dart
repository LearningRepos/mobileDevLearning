import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int noteNumber) {
    final player = AudioCache();
    player.play("note$noteNumber.wav");
  }

  Expanded colorSection(Color color, int noteNumber) {
    return Expanded(
      child: FlatButton(
        color: color,
        onPressed: () {
          playSound(noteNumber);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                colorSection(Colors.red, 1),
                colorSection(Colors.orange, 2),
                colorSection(Colors.yellow, 3),
                colorSection(Colors.green, 4),
                colorSection(Colors.teal, 5),
                colorSection(Colors.blue, 6),
                colorSection(Colors.purple, 7),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
