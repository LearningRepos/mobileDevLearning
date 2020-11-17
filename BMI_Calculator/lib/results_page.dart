import "package:flutter/material.dart";
import "constants.dart";
import 'reuseable_card.dart';

class ResultsPage extends StatelessWidget {
  final String bmiWord;
  final String bmiNumber;
  final String bmiDescription;
  ResultsPage(this.bmiWord, this.bmiNumber, this.bmiDescription);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              child: Text(
                "Your Result",
                style: kNumberTextStyle,
              ),
              margin: EdgeInsets.all(20),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            flex: 7,
            child: ReuseableCard(
              kActiveCardColor,
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "$bmiWord",
                    style: kBmiStatusTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "$bmiNumber",
                    style: kBmiTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "$bmiDescription",
                    style: kBmiDescriptionTextStyle,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              color: kBottomContainerColor,
              height: kBottomContainerHeight,
              child: Center(
                child: Text(
                  "RE-CALCULATE",
                  style: kLargeButtonTextStyle,
                ),
              ),
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              padding: EdgeInsets.only(bottom: 20),
            ),
          ),
        ],
      ),
    );
  }
}
