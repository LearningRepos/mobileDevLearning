import 'package:flutter/material.dart';

class ReuseableCard extends StatelessWidget {
  ReuseableCard(this.color, [this.cardChild]);
  final Color color;
  final Widget cardChild;
  // final Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // onPress;
      },
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
      ),
    );
  }
}