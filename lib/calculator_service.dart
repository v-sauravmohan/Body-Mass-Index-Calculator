import 'dart:math';

import 'package:body_mass_index_calculator/constants.dart';

class CalculatorService {
  final int height;
  final int weight;
  final int age;
  final Gender gender;
  double _bmi;

  CalculatorService({this.height, this.weight, this.age, this.gender});

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Over Weight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Under Weight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight, Try to exercise more.';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You should eat a bit more.';
    }
  }
}
