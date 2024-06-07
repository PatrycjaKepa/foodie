import 'package:flutter/material.dart';
import 'package:foodie/Buttons/start_login_button.dart';
import 'package:foodie/Buttons/start_registration_button.dart';
import 'package:foodie/reusable/time_now.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        const TimeNow(),
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _foodieLogo(context),
              SizedBox(height: 60,),
              StartLoginButton(),
              SizedBox(height: 20,),
              StartRegistrationButton(),
            ],
          ),
        ),
      ]),
    );
  }
}

_foodieLogo(context) {
  return Column(
    children: [
      Text(
        'Foodie',
        textAlign: TextAlign.center,
        style: GoogleFonts.lobster(
          textStyle:
              const TextStyle(fontSize: 60, color: Colors.white, shadows: [
            Shadow(
              color: Colors.black45,
              blurRadius: 1.0,
              offset: Offset(2.0, 2.0),
            )
          ]),
        ),
      )
    ],
  );
}
