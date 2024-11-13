import 'package:flutter/material.dart';
import 'package:foodie/routesAndOthers/time_now.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        const TimeNow(),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _foodieLogo(context),

              const SizedBox(
                height: 60,
              ),

              ElevatedButton(
                onPressed: () => context.go('/login'),
                style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(
                      side: BorderSide(
                        color: Color.fromARGB(255, 144, 213, 255),
                        style: BorderStyle.solid,
                        width: 3,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent),
                child: const Text(
                  "Zaloguj się",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              ElevatedButton(
                onPressed: () => context.go('/registration'),
                style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(
                      side: BorderSide(
                        color: Color.fromARGB(255, 144, 213, 255),
                        style: BorderStyle.solid,
                        width: 2,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    backgroundColor: const Color.fromARGB(255, 144, 213, 255),
                    shadowColor: Colors.transparent),
                child: const Text(
                  "Zarejestruj się",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
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