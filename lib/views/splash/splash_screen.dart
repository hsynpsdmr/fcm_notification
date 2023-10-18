import 'dart:async';

import 'package:fcm_notification/views/auth/sign_up.dart';
import 'package:fcm_notification/views/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    if (user.isNull) {
      Timer(Duration(seconds: 5), () => Get.offAll(() => SignUp()));
    } else {
      Timer(Duration(seconds: 5), () => Get.offAll(() => HomeScreen()));
    }
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                width: Get.width,
                height: 220,
                child: Image.network(
                  "https://buildfire.com/wp-content/uploads/2018/03/what-is-a-push-notification-and-why-it-matters-1200x900.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text("FCM")
          ],
        ),
      ),
    );
  }
}
