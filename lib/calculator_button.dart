import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  const CalculatorButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.fontSize = 32});

  final void Function() onPressed;
  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        alignment: Alignment.center,
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
            side: const BorderSide(color: Colors.red),
          ),
        ),
        backgroundColor: MaterialStateProperty.resolveWith<MaterialColor>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.hovered)) return Colors.teal;
          return Colors.indigo;
        }),
      ),
      child: Text(
        text,
        style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.amber),
      ),
    );
  }
}
