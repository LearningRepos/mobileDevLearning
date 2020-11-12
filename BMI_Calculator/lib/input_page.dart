import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import "card_content.dart";
import 'reuseable_card.dart';

const bottomContainerHeight = 80.0;
const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
const bottomContainerColor = Color(0xFFEB1555);

Color maleCardColor;
Color femaleCardColor;

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: ReuseableCard(
                    maleCardColor = selectedGender == Gender.male
                        ? activeCardColor
                        : inactiveCardColor,
                    CardContent(
                      "MALE",
                      Icon(
                        FontAwesomeIcons.mars,
                        size: 80,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    femaleCardColor = selectedGender == Gender.female
                        ? activeCardColor
                        : inactiveCardColor,
                    CardContent(
                      "FEMALE",
                      Icon(
                        FontAwesomeIcons.venus,
                        size: 80,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: ReuseableCard(
              activeCardColor,
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: ReuseableCard(
                    activeCardColor,
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    activeCardColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: bottomContainerColor,
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: bottomContainerHeight,
          ),
        ],
      ),
    );
  }
}
