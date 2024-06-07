import 'package:flutter/material.dart';

class SectionButton extends StatelessWidget {
  const SectionButton(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 300,
      child: ElevatedButton(
        onPressed: () {},
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            text,
          ),
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
      ),
    );
  }
}
