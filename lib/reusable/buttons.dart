import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RedirectButton extends StatelessWidget {
  final String text;
  final String path;

  const RedirectButton(this.text,this.path,{super.key});

  @override
  Widget build(BuildContext context) {
  return ElevatedButton(onPressed: () => context.go(path), 
  child: Text(text, 
  style: TextStyle(
    color: Colors.white,
    fontSize: 16,
    ),
  ),
    style: ElevatedButton.styleFrom(
      shape: StadiumBorder(),
      padding: EdgeInsets.symmetric(vertical: 18),
      backgroundColor: Color.fromARGB(255, 144, 213, 255),
      shadowColor: Colors.transparent
    ),
    );
  }
}