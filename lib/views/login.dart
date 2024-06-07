import 'package:flutter/material.dart';
import 'package:foodie/cards/login.dart';
import 'package:foodie/reusable/time_now.dart';

class LoginPage extends StatelessWidget {
  const LoginPage ({super.key});

  @override
  Widget build (BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Stack(
            children: [
              TimeNow(),
              LoginCard(),
              ],),),
      );
  }
}