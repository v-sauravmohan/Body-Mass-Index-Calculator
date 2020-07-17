import 'package:body_mass_index_calculator/calculator_service.dart';
import 'package:body_mass_index_calculator/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'reusable_classes.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender genderSelected = Gender.male;
  int height = 180; // in Centimeters
  int weight = 60; // in KiloGrams
  int age = 20; // in Years

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        if (genderSelected != Gender.male) {
                          genderSelected = Gender.male;
                        }
                      });
                    },
                    colour: genderSelected == Gender.male
                        ? Color(kCardsActiveColour)
                        : Color(kCardsInActiveColour),
                    cardChild: ReUsableIconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                      labelColor: kCardLabelActiveColor,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        if (genderSelected != Gender.female) {
                          genderSelected = Gender.female;
                        }
                      });
                    },
                    colour: genderSelected == Gender.female
                        ? Color(kCardsActiveColour)
                        : Color(kCardsInActiveColour),
                    cardChild: ReUsableIconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                      labelColor: kCardLabelActiveColor,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: Color(kCardsActiveColour),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberStyle,
                      ),
                      SizedBox(width: 5.0),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(kSliderInActiveColor),
                      thumbColor: Color(kSliderActiveColor),
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderThumbShape(enabledThumbRadius: 20.0),
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
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: Color(kCardsActiveColour),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            BomiRoundButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                if (weight < 300) {
                                  setState(() {
                                    weight = weight + 1;
                                  });
                                }
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            BomiRoundButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                if (weight > 0) {
                                  setState(() {
                                    weight = weight - 1;
                                  });
                                }
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: Color(kCardsActiveColour),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            BomiRoundButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                if (age < 130) {
                                  setState(() {
                                    age = age + 1;
                                  });
                                }
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            BomiRoundButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                if (age > 0) {
                                  setState(() {
                                    age = age - 1;
                                  });
                                }
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          BomiBottomButton(
            label: 'CALCULATE',
            onTap: () {
              CalculatorService calculate = CalculatorService(
                height: height,
                weight: weight,
                age: age,
                gender: genderSelected,
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultsPage(
                          resultIndex: calculate.calculateBMI(),
                          bmiResult: calculate.getResult(),
                          interpretation: calculate.getInterpretation(),
                        )),
              );
            },
          ),
        ],
      ),
    );
  }
}
