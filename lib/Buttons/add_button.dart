import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  const AddButton(this.text, {super.key});

  final String text;

  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 144, 213, 255),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
    );
  }
}
