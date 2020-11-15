import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import "card_content.dart";
import 'reuseable_card.dart';
import 'constants.dart';

enum Gender { male, female }
enum Operation { add, subtract }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 19;

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
                    selectedGender == Gender.male
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
                    selectedGender == Gender.female
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: kTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(
                        "$height",
                        style: kNumberTextStyle,
                      ),
                      Text(
                        "cm",
                        style: kTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                      overlayColor: Color(0x29EB1555),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.toInt();
                        });
                      },
                    ),
                  ),
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: kTextStyle,
                        ),
                        Text(
                          "$weight",
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              FontAwesomeIcons.minus,
                              Operation.subtract,
                              () {
                                setState(
                                  () {
                                    weight--;
                                  },
                                );
                              },
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            RoundIconButton(
                              FontAwesomeIcons.plus,
                              Operation.add,
                              () {
                                setState(
                                  () {
                                    weight++;
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    kActiveCardColor,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: kTextStyle,
                        ),
                        Text(
                          "$age",
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              FontAwesomeIcons.minus,
                              Operation.subtract,
                              () {
                                setState(
                                  () {
                                    age--;
                                  },
                                );
                              },
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            RoundIconButton(
                              FontAwesomeIcons.plus,
                              Operation.add,
                              () {
                                setState(
                                  () {
                                    age++;
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
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

  void increaseWeight(Operation selectedOperation) {}
}

class RoundIconButton extends StatelessWidget {
  final IconData userIcon;
  final Operation operation;
  final Function onPress;
  RoundIconButton(this.userIcon, this.operation, this.onPress);
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        onPress();
      },
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      child: Icon(userIcon),
    );
  }
}
