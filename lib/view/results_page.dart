import 'package:untitled6/model/constants.dart';
import 'package:flutter/material.dart';
import 'package:untitled6/model/history.dart';
import 'package:untitled6/view/reuseable_card.dart';
import 'package:untitled6/view/bottom_button.dart';
import 'package:get/get.dart';
import 'package:untitled6/controller/home_controller.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.interpretation});
  final String? bmiResult;
  final String? resultText;
  final String? interpretation;
  Copy controller1 = Get.put(Copy(),permanent: true);
  Copy2 controller2 = Get.put(Copy2(),permanent: true);
  GenderMF controller3=Get.put(GenderMF());
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF111328),
        title: Text('BMI Calculate'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.history,
              color: Colors.white,
            ),
            onPressed: () {
              Get.to(()=>HistoryScreen());
            },
          ),
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: () {
              HistoryScreen().signOut();
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(15.0),
                  alignment: Alignment.bottomLeft,
                  child: Center(
                    child: Text(
                      'Your Result ${controller1.name}',
                      style: kTitleTextStyle,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Name : ${controller1.name}',style: kNameTextStyle,),
                    Text('Age : ${controller2.age}',style: kNameTextStyle),

                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    Text('height : ${controller2.height}',style: kNameTextStyle,),
                    Text('Weight : ${controller2.weight}',style: kNameTextStyle,),
                    // Text('Weight : ${controller2.weight}'),


                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: ReusableCard(
              colour: kActiveColorCard,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(resultText!.toUpperCase(), style: kResultT3extStyle),
                  Text(
                    bmiResult!,
                    style: kBMITextStyle,
                  ),
                  Text(
                    interpretation!,
                    style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
              onTap: () {
                Get.back();
              },
              buttonTitle: 'RE-CALCULATE')
        ],
      ),
    );
  }
}
