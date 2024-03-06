import 'package:flutter/material.dart';
import 'package:basic_rpn_calculator/calculator_core.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: CalculatorCore(
            size: 400,
          ),
        ),
      ),
    );
  }
}
