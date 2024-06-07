import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StartRegistrationButton extends StatelessWidget {
  const StartRegistrationButton ({super.key});

  @override
  Widget build (BuildContext context){
    return ElevatedButton(
    onPressed: () => context.go('/registration'),
    style: ElevatedButton.styleFrom(
        shape: StadiumBorder(
          side: BorderSide(
            color: Color.fromARGB(255, 144, 213, 255),
            style: BorderStyle.solid,
            width: 2,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 18),
        backgroundColor: Color.fromARGB(255, 144, 213, 255),
        shadowColor: Colors.transparent),
    child: Text(
      "Zarejestruj się",
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
    ),
  );
  }
}