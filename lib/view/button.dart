import 'package:untitled6/controller/home_controller.dart';
import 'package:untitled6/model/icon_content.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled6/view/main2.dart';
import 'package:untitled6/view/reuseable_card.dart';
import 'package:untitled6/model/constants.dart';
import 'package:untitled6/view/results_page.dart';
import 'package:untitled6/view/bottom_button.dart';
import 'package:untitled6/view/round_icon_button.dart';
import 'package:untitled6/model/calculate_brain.dart';
import 'package:get/get.dart';

enum Gender { male, female }

class InputPage extends StatelessWidget {
  Copy controller1 = Get.put(Copy(),permanent: true);
  Copy2 controller2 = Get.put(Copy2(),permanent: true);
  GenderMF controller3=Get.put(GenderMF());
  Gender? selectedGender;
  int height = 180;
  int weight = 75;
  int age = 20;


  int? height1 ;
  int? weight1 ;
  int? age1 ;

  InputPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kActiveColorCard,
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      resizeToAvoidBottomInset: false,
      body: GetBuilder<Copy2>(builder: (controller)=>Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
      Text(
        'Welcome ${controller1.name} ',
        style: kNameTextStyle,
        textAlign: TextAlign.center,
      ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: GetBuilder<Copy2>(builder: (controller2)=>ReusableCard(
                  onPress: () {
                    controller3.male();
                  },
                  colour: controller3.selectedGender == Gender.male
                      ? kActiveColorCard
                      : kInactiveCardColor,
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.mars,
                    label: 'MALE',
                  ),
                ),
                ),
              ),
              Expanded(
                child:ReusableCard(
                  onPress: () {

                      controller3.female();
                  },
                  colour: controller3.selectedGender == Gender.female
                      ? kActiveColorCard
                      : kInactiveCardColor,
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.venus,
                    label: 'FEMALE',
                  ),

                ),

              ),
            ],
          ),
          ),
          Expanded(
            child: ReusableCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          thumbColor: Color(0xFFEB1555),
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Color(0xFF8D8E98),
                          overlayColor: Color(0x29EB1555),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0)),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue) {

                            // height = newValue.round();
                    // controller2.moveHeight();

                        },
                      ),
                    )
                  ],
                ),
                colour: kActiveColorCard),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveColorCard,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          controller2.weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                               RounIconButton(
                                   icon: FontAwesomeIcons.minus,
                                   onPressed: () {
                                     controller2.decrementWeight();
                                   },
                               ),
                            SizedBox(width: 10.0),
                            RounIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                controller2.incrementWeight();

                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveColorCard,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          controller2.age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          RounIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  controller2.decrementAge();
                                },),
                            SizedBox(width: 10.0),
                            RounIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                  controller2.incrementAge();

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
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              {
                CalculatorBrain cal =
                    CalculatorBrain(height: height, weight: weight);
                Get.to(arguments: {'name':name,'age':age,'weight':weight,'height': height},
                  () => ResultPage(
                    bmiResult: cal.calculateBMI(),
                    resultText: cal.getResult(),
                    interpretation: cal.getInterpretation(),
                  ),
                );
              }
            },
          ),
        ],
      ),
      ),
    );
  }
}
