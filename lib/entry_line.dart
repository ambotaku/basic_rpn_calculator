import 'package:flutter/material.dart';

class EntryLine extends StatelessWidget {
  const EntryLine({super.key, required this.number, required this.size});

  final String number;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      width: size.width,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.teal[400],
        border: Border.all(color: Colors.black),
      ),
      child: Text(
        number,
        textAlign: TextAlign.end,
        style: const TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
