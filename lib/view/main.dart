import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main2.dart';

void main() {
  runApp(const BMICalculator());

}

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp1(),
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0B0D22),
      ),
    );
  }
}
