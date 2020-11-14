import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import "card_content.dart";
import 'reuseable_card.dart';
import 'constants.dart';

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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: ReuseableCard(
                    maleCardColor = selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    CardContent(
                      "MALE",
                      Icon(
                        FontAwesomeIcons.mars,
                        size: 80,
                      ),
                    ),
                    () {
                      setState(
                        () {
                          selectedGender = Gender.male;
                        },
                      );
                    },
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    femaleCardColor = selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    CardContent(
                      "FEMALE",
                      Icon(
                        FontAwesomeIcons.venus,
                        size: 80,
                      ),
                    ),
                    () {
                      setState(
                        () {
                          selectedGender = Gender.female;
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: ReuseableCard(
              kActiveCardColor,
              Column(
                children: [
                  Text(
                    "HEIGHT",
                    style: kTextStyle,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: ReuseableCard(
                    kActiveCardColor,
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    kActiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: kBottomContainerColor,
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: kBottomContainerHeight,
          ),
        ],
      ),
    );
  }
}
