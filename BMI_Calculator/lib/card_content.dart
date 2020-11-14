import 'package:flutter/material.dart';
import 'constants.dart';

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
          style: kTextStyle,
        ),
      ],
    );
  }
}
