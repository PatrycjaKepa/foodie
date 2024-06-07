import 'package:flutter/material.dart';
import 'package:foodie/cards/registration.dart';
import 'package:foodie/reusable/time_now.dart';

class RegistrationPage extends StatelessWidget{
  const RegistrationPage({super.key});

   @override
  Widget build (BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Stack(
            children: [
              TimeNow(),
              RegistrationCard(),
              ],),),
      )
    );
  }
}