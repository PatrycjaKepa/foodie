import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StartLoginButton extends StatelessWidget {
  const StartLoginButton ({super.key});

  @override
  Widget build (BuildContext context){
    return ElevatedButton(
    onPressed: () => context.go('/login'),
    style: ElevatedButton.styleFrom(
        shape: StadiumBorder(
          side: BorderSide(
            color: Color.fromARGB(255, 144, 213, 255),
            style: BorderStyle.solid,
            width: 3,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 18),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent),
    child: Text(
      "Zaloguj się",
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
    ),
  );
  }
}