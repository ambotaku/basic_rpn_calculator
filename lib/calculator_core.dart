import 'package:flutter/material.dart';
import 'package:basic_rpn_calculator/calculator_button.dart';
import 'package:basic_rpn_calculator/entry_line.dart';
import 'package:basic_rpn_calculator/stack_view.dart';

typedef OpFunc = double Function(double, double);

class CalculatorCore extends StatefulWidget {
  const CalculatorCore({super.key, required this.size});

  final double size;

  @override
  State<CalculatorCore> createState() => _CalculatorCoreState();
}

class _CalculatorCoreState extends State<CalculatorCore> {
  String number = '';
  bool hasDot = false;
  List<double> stack = [];

  void typeKey(int digit) {
    setState(() {
      number = '$number${digit.toString()}';
    });
  }

  void doBinaryOp(OpFunc fnc) {
    setState(() {
      var op1 = stack.removeLast();
      var op2 = stack.removeLast();
      var result = fnc(op1, op2);
      stack.add(result);
      number = '$result';
    });
  }

  void binaryOp(OpFunc fnc) {
    if (stack.length >= 2) {
      doBinaryOp(fnc);
    } else if (stack.length == 1 && number.isNotEmpty) {
      double? value = double.tryParse(number);
      if (value != null) {
        stack.add(value);
        number = '';
        doBinaryOp(fnc);
      }
    }
  }

  void typeOp(String op) {
    switch (op) {
      case 'push':
        if (number.isNotEmpty) {
          setState(() {
            double? value = double.tryParse(number);
            if (value != null) {
              stack.add(value);
              number = '';
            }
          });
        }
        break;
      case 'pop':
        setState(() {
          if (stack.isNotEmpty) {
            stack.removeLast();
          }
        });
        break;
      case 'swap':
        setState(() {
          if (stack.length >= 2) {
            var value = stack.removeAt(stack.length - 2);
            stack.add(value);
          }
        });
        break;
      case 'clr':
        setState(() {
          stack = [];
          number = '';
        });
        break;
      case '+':
        binaryOp((p0, p1) => p1 + p0);
        break;
      case '-':
        binaryOp((p0, p1) => p1 - p0);
        break;
      case '*':
        binaryOp((p0, p1) => p1 * p0);
        break;
      case '/':
        binaryOp((p0, p1) => p1 / p0);
        break;
    }
  }

  void backSpace() {
    if (number.isEmpty) {
      return;
    }

    setState(() {
      int lastCharIndex = number.length - 1;
      if (number[lastCharIndex] == '.') {
        hasDot = false;
      }
      number = number.substring(0, lastCharIndex);
      //widget.onEntryChanged(number);
    });
  }

  void typeDot() {
    if (!hasDot) {
      setState(() {
        hasDot = true;
        number = '$number.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StackView(stack: stack),
        EntryLine(number: number),
        Container(
          width: 400,
          height: 500,
          decoration: const BoxDecoration(
            color: Colors.grey,
          ),
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(10),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 4,
            children: <Widget>[
              CalculatorButton(
                  onPressed: () {
                    typeOp('clr');
                  },
                  text: 'AC'),
              CalculatorButton(
                  onPressed: () {
                    typeOp('swap');
                  },
                  fontSize: 20,
                  text: 'swap'),
              CalculatorButton(
                  onPressed: () {
                    typeOp('swap');
                  },
                  fontSize: 20,
                  text: 'pop'),
              CalculatorButton(
                onPressed: () {
                  typeOp('push');
                },
                text: 'push',
                fontSize: 20,
              ),
              CalculatorButton(
                  onPressed: () {
                    typeKey(7);
                  },
                  text: '7'),
              CalculatorButton(
                  onPressed: () {
                    typeKey(8);
                  },
                  text: '8'),
              CalculatorButton(
                  onPressed: () {
                    typeKey(9);
                  },
                  text: '9'),
              CalculatorButton(
                  onPressed: () {
                    typeOp('/');
                  },
                  text: '/'),
              CalculatorButton(
                  onPressed: () {
                    typeKey(4);
                  },
                  text: '4'),
              CalculatorButton(
                  onPressed: () {
                    typeKey(5);
                  },
                  text: '5'),
              CalculatorButton(
                  onPressed: () {
                    typeKey(6);
                  },
                  text: '6'),
              CalculatorButton(
                  onPressed: () {
                    typeOp('*');
                  },
                  text: '*'),
              CalculatorButton(
                  onPressed: () {
                    typeKey(1);
                  },
                  text: '1'),
              CalculatorButton(
                  onPressed: () {
                    typeKey(2);
                  },
                  text: '2'),
              CalculatorButton(
                  onPressed: () {
                    typeKey(3);
                  },
                  text: '3'),
              CalculatorButton(
                  onPressed: () {
                    typeOp('-');
                  },
                  text: '-'),
              CalculatorButton(
                  onPressed: () {
                    typeKey(0);
                  },
                  text: '0'),
              CalculatorButton(
                  onPressed: () {
                    typeDot();
                  },
                  text: '-'),
              CalculatorButton(
                onPressed: () {
                  backSpace();
                },
                text: '\u2B05',
                fontSize: 44,
              ),
              CalculatorButton(
                onPressed: () {
                  typeOp('+');
                },
                text: '+',
                fontSize: 32,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
