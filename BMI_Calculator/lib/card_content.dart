import 'package:flutter/material.dart';

// ignore: camel_case_types
// ignore: must_be_immutable
// ignore: camel_case_types
class Card_Content extends StatelessWidget {
  String contentText;
  Icon contentIcon;
  Card_Content(this.contentText, this.contentIcon);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        contentIcon,
        SizedBox(
          height: 15,
        ),
        Text(
          contentText,
          style: TextStyle(fontSize: 18, color: Color(0xFF8D8E98)),
        ),
      ],
    );
  }
}
