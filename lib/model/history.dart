import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled6/view/main2.dart';
import 'package:get/get.dart';
import 'package:untitled6/model/constants.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  signOut() {
    Get.defaultDialog(
      title: 'Sign out',
      middleText: 'Do you really want to sign out ?',
      textCancel: 'Cancel',
      textConfirm: 'Confirm',

      onConfirm: () {
        Get.offAll(MyApp1());
        Get.showSnackbar(GetSnackBar(
          title: 'Signed out',
          message: 'Signed out successfully',
          duration: Duration(seconds: 3),
          backgroundColor: Color(0xFF323233),
        ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF111328),
        title: Text('BMI Calculate'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: () {
              signOut();
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(15.0),
                  alignment: Alignment.bottomLeft,
                  child: Center(
                    child: Text(
                      'Your Result Mohamed',
                      style: kTitleTextStyle,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Name:'),
                    Text('Gender'),
                    Text('Age'),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
