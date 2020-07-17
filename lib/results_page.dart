import 'package:body_mass_index_calculator/calculator_service.dart';
import 'package:body_mass_index_calculator/reusable_classes.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class ResultsPage extends StatelessWidget {
  final String bmiResult;
  final String resultIndex;
  final String interpretation;

  ResultsPage({this.bmiResult, this.resultIndex, this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Text(
                'Your Results',
                style: kTitleTextStyle,
              ),
              padding: EdgeInsets.all(kReusableCardsMargins),
              alignment: Alignment.bottomLeft,
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: Color(kCardsActiveColour),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    this.bmiResult,
                    style: kResultTextStyle,
                  ),
                  Text(
                    this.resultIndex,
                    style: kResultValueTextStyle,
                  ),
                  Text(
                    this.interpretation,
                    textAlign: TextAlign.center,
                    style: kResultBodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          BomiBottomButton(
            label: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
