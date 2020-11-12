import 'package:flutter/material.dart';

class Reuseable_Card extends StatelessWidget {
  Reuseable_Card(this.color, [this.cardChild]);
  final Color color;
  final Widget cardChild;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
    );
  }
}
