import 'package:flutter/material.dart';

class TimeNow extends StatelessWidget{
  const TimeNow({super.key});
  
  @override
  Widget build(context) {

    DateTime now = DateTime.now();

    return Builder(builder: (context) {

      if(now.hour >= 5 && now.hour < 12) {
        return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                Color.fromARGB(255, 71, 200, 239), 
                Color.fromARGB(255, 182, 221, 190), 
                Color.fromARGB(255, 245, 245, 193), 
                Colors.white
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
              ),
            ),
          );
      }

      if(now.hour >= 12 && now.hour < 18){
        return 
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 24, 48, 145), 
                      Color.fromARGB(255, 91, 154, 235), 
                      Color.fromARGB(255, 140, 164, 213), 
                      Color.fromARGB(255, 220, 228, 240)
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter
                  ),
                ),
              );
      }

      if(now.hour >= 18 && now.hour < 21){
        return Container(
          decoration: const BoxDecoration(gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 240, 214, 137), 
              Color.fromARGB(255, 190, 175, 165), 
              Color.fromARGB(255, 122, 62, 100)
              ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
            ),
            ),
          );
        }

        if(now.hour >= 21 && now.hour > 5){
        return Container(
          decoration: const BoxDecoration(gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 9, 9, 24), 
              Color.fromARGB(255, 16, 38, 73), 
              Color.fromARGB(255, 41, 83, 121), 
              Color.fromARGB(255, 129,151,172)
              ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
            ),
            ),
          );
        }
        else{
          return const Text("Coś poszło nie tak");
      }
    },);
      
  }
}