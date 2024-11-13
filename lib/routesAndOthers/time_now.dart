import 'package:flutter/material.dart';

class TimeNow extends StatelessWidget {
  const TimeNow({super.key});

  @override
  Widget build(context) {
    DateTime now = DateTime.now();

    return Builder(builder: (context) {
      if (now.hour >= 5 && now.hour < 12) {
        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 148, 203, 242),
                Color.fromARGB(255, 247, 240, 224),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        );
      }

      if (now.hour >= 12 && now.hour < 18) {
        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 93, 100, 190),
                Color.fromARGB(255, 144, 213, 255),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        );
      }

      if (now.hour >= 18 && now.hour < 21) {
        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 245, 121, 85),
                Color.fromARGB(255, 250, 170, 117),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        );
      }

      if (now.hour >= 21 || now.hour < 5) {
        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 9, 9, 24),
                Color.fromARGB(255, 93, 100, 190),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        );
      } else {
        return const Text("Coś poszło nie tak");
      }
    });
  }
}
