import 'package:flutter/material.dart';
import 'package:basic_rpn_calculator/calculator_core.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (size.width > 400) {
      size = Size(400, size.height);
    }

    return MaterialApp(
      title: 'Basic Calculator',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: CalculatorCore(
            size: size,
          ),
        ),
      ),
    );
  }
}
