import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled6/view/button.dart';
import 'package:untitled6/view/main2.dart';
import 'package:untitled6/view/reuseable_card.dart';

import 'package:untitled6/model/constants.dart';

enum Gender { male, female }
class GenderMF extends GetxController {

  String? gender;
  Gender? selectedGender;

  void male(){

    selectedGender = Gender.male;
    ReusableCard(colour: selectedGender == Gender.male
        ? kActiveColorCard
        : kInactiveCardColor);

    update();
  }
  void female(){

selectedGender=Gender.female;
    update();
  }
}



class Copy extends GetxController {
  String? name;
  @override
  void onInit() {
    name = Get.arguments['name'];

    super.onInit();
  }
}

class Copy2 extends GetxController {
  // int age= InputPage().age;
  String? gender;
  int height = 180;
  int weight = 75;
  int age = 20;
  String? result;
  double newValue=0;
  @override



  void onInit() {
    // gender = Get.arguments['gender'];
    // weight = Get.arguments['weight'];
    // height = Get.arguments['height'];
    // result = Get.arguments['result'];

    super.onInit();
  }

   moveHeight(){
     height = newValue.round();
    update();
  }
  void incrementWeight(){
    weight++;
    update();
  }
  void decrementWeight(){
    weight--;
    update();
  }
  void incrementHeight(){
    height++;
    update();
  }
  void decrementHeight(){
    height--;
    update();
  }
  void incrementAge(){
    age++;
    update();
  }
  void decrementAge(){
    age--;
    update();
  }
}
