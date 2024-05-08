import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodie/style_text.dart';
import 'package:foodie/time_now.dart';

class StartScreen extends StatelessWidget{
const StartScreen({super.key});

@override
  Widget build(BuildContext context){
    return Column(children: [
      TimeNow(),
      StyledText("działa")
    ],);
    
  }
}