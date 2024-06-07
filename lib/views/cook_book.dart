import 'package:flutter/material.dart';
import 'package:foodie/Buttons/add_button.dart';
import 'package:foodie/Buttons/section_button.dart';
import 'package:foodie/reusable/time_now.dart';

class CookBookPage extends StatelessWidget {
  const CookBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        width: double.infinity,
        child: Stack(
          children: [
            TimeNow(),
            Container(
              margin: EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _horizontalLine(context),
                        Row(
                          children: [
                            AddButton('Dodaj nową sekcję'),
                          ],
                        ),
                        _horizontalLine(context),
                        Row(
                          children: [
                          SectionButton('Śniadanie'),
                        ],)
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}

_horizontalLine(context){
  return SizedBox(
          width: 320,
          child: Divider(
            color: Colors.grey,
            thickness: 1,),
        );
}