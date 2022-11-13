import 'package:flutter/material.dart';
import 'package:untitled6/model/constants.dart';


class IconContent extends StatelessWidget {

   IconContent({this.icon,this.label});

   final IconData ?icon;
   final String ?label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
            icon,
          size: 80.0,
        ),
         SizedBox(
          height: 15.0,
        ),
        Text(
          label!,
          style: kLabelTextStyle ,
        ),
      ],
    );
  }
}


