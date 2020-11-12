import 'package:flutter/material.dart';

class CardContent extends StatelessWidget {
  final String contentText;
  final Icon contentIcon;
  CardContent(this.contentText, this.contentIcon);
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
