import 'package:flutter/material.dart';
import 'package:untitled6/view/button.dart';

import 'package:get/get.dart';
import 'package:untitled6/model/constants.dart';


class MyApp1 extends StatelessWidget {
  // const MyApp1({Key? key}) : super(key: key);

  String name = "";
  // Copy controller1 = Get.put(Copy(),permanent: true);
  // Copy2 controller2 = Get.put(Copy2(),permanent: true);
  // GenderMF controller3=Get.put(GenderMF());
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  MyApp1({super.key});

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BMI Calculator"),
        backgroundColor: kActiveColorCard,

      ),
        // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
          child: Padding(
          padding: const EdgeInsets.only(top: 45),
          child: Column(children: [
            Form(
              key: formkey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset("assets/images/bmi1.png",height: 100,),

                    // Icon(
                    //   Icons.person,
                    //   size: 50,
                    // ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Welcome back ',
                      style: kLoginTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    Text(
                      'Sign in to continue',
                      style: kBodyTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 30,
                    ),

// Text('Name',style: kTitleTextStyle,textAlign: TextAlign.left,),

                      TextFormField(
                        validator: (value) {
                          name = value!;
                          return value.isEmpty ? "Enter your name" : null;
                        },
                        decoration: InputDecoration(
                            label: Text("Enter your name please"),
                            hintText: "full name",
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(color: Colors.grey),
                            )),
                      ),

                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: MaterialButton(
                            onPressed: () {
                              if (formkey.currentState!.validate()) {
                                Get.offAll(() => InputPage(),arguments: {'name' : name});
                              }

                            },
                            color: Colors.blue,
                            child: Text("Login"),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ]),
      ),
        ),
    );
  }
}

String name = "";
