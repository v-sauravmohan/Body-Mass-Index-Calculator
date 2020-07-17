import 'package:flutter/material.dart';

// Enum
enum Gender {
  male,
  female,
}

// Dimensions
const kReusableCardsMargins = 15.0;
const kReusableCardsBorderRadius = 10.0;
const kBottomContainerHeight = 80.0;
const kBottomContainerMargin = 10.0;

//Colors
const kCardsActiveColour = 0xFF1D1E33;
const kCardsInActiveColour = 0xFF11132B;
const kBottomContainerColour = 0xFFEB1555;
const kCardLabelActiveColor = 0xFF8D8E98;
const kSliderActiveColor = 0xFFEB1555;
const kSliderInActiveColor = 0xFF8D8E98;

const kLabelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(kCardLabelActiveColor),
);

const kNumberStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
);

const kButtonLabelStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.w700,
);

const kTitleTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 50.0,
);

const kResultTextStyle = TextStyle(
  color: Color(0xFF24D876),
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
);

const kResultValueTextStyle = TextStyle(
  fontSize: 100.0,
  fontWeight: FontWeight.bold,
);

const kResultBodyTextStyle = TextStyle(
  fontSize: 22.0,
);
