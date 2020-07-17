import 'package:flutter/material.dart';

import 'constants.dart';

// Widget that manages the content inside Reusable Card
class ReUsableIconContent extends StatelessWidget {
  final IconData icon;
  final String label;
  final int labelColor;

  ReUsableIconContent({this.icon, this.label, this.labelColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          this.icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          this.label,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}

// Widget That Manages the Reusable Card
class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  final Function onPress;
  ReusableCard({@required this.colour, this.cardChild, this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        this.onPress();
      },
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(kReusableCardsMargins),
        decoration: BoxDecoration(
          color: this.colour,
          borderRadius: BorderRadius.circular(kReusableCardsBorderRadius),
        ),
      ),
    );
  }
}

class BomiBottomButton extends StatelessWidget {
  final String label;
  final Function onTap;

  BomiBottomButton({this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        child: Center(
          child: Text(
            this.label,
            style: kButtonLabelStyle,
          ),
        ),
        color: Color(kBottomContainerColour),
        margin: EdgeInsets.only(top: kBottomContainerMargin),
        height: kBottomContainerHeight,
        width: double.infinity,
      ),
    );
  }
}

class BomiRoundButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  BomiRoundButton({@required this.icon, @required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(this.icon),
      elevation: 6.0,
      onPressed: onPressed,
      shape: CircleBorder(),
      fillColor: Color(0XFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}
