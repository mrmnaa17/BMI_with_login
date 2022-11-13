import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/painting/text_style.dart';

import 'package:untitled6/model/constants.dart';

enum BmiType {
  severelyUnderweight,
  underweight,
  normal,
  overweight,
  moderatelyObese,
  severelyObese,
  morbidlyObese
}
Map<BmiType, TextStyle> colors = {
  BmiType.severelyUnderweight: kResult1TextStyle,
  BmiType.underweight:kResult1TextStyle,
  BmiType.normal:kResultTextStyle,
  BmiType.overweight:kResult2TextStyle,
  BmiType.moderatelyObese:kResultT3extStyle,
  BmiType.severelyObese:kResultT3extStyle,
  BmiType.morbidlyObese:kResultT3extStyle
};

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});
  final int? height;
  final int? weight;

  late double _bmi;

  String calculateBMI() {
    _bmi = weight! / pow(height! / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi < 16) {
      return 'Severely Underweight';
    } else if (_bmi >= 16 && _bmi <= 18.4) {
      return 'Underweight';
    } else if (_bmi >= 18.5 && _bmi <= 24.9) {
      return 'Normal';
    } else if (_bmi >= 25 && _bmi <= 29.9) {
      return 'Overweight';
    } else if (_bmi >= 30 && _bmi <= 34.9) {
      return 'Moderately Obese';
    } else if (_bmi >= 35 && _bmi <= 39.9) {
      return 'Severely Obese';
    } else {
      return 'Morbidly Obese';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
  TextStyle styleColor(){
    if (_bmi < 16) {
      return kResult1TextStyle;
    } else if (_bmi >= 16 && _bmi <= 18.4) {
      return kResult1TextStyle;
    } else if (_bmi >= 18.5 && _bmi <= 24.9) {
      return kResultTextStyle;
    } else if (_bmi >= 25 && _bmi <= 29.9) {
      return kResult2TextStyle;
    } else if (_bmi >= 30 && _bmi <= 34.9) {
      return kResultT3extStyle;
    } else if (_bmi >= 35 && _bmi <= 39.9) {
      return kResultT3extStyle;
    } else {
      return kResultT3extStyle;
    }
  }



  Color getColor(){
    if (_bmi < 16) {
      return Color(0xFFFFC97B);
    } else if (_bmi >= 16 && _bmi <= 18.4) {
      return  Color(0xFFFFC97B);
    } else if (_bmi >= 18.5 && _bmi <= 24.9) {
      return Color(0xFF24D876);
    } else if (_bmi >= 25 && _bmi <= 29.9) {
      return Color(0xFFC25400);
    } else if (_bmi >= 30 && _bmi <= 34.9) {
      return Color(0xFFE13254);
    } else if (_bmi >= 35 && _bmi <= 39.9) {
      return Color(0xFFE13254);
    } else {
      return Color(0xFFE13254);
    }
  }
}
