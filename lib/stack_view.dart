import 'package:flutter/material.dart';

class StackView extends StatelessWidget {
  const StackView(
      {super.key,
      required this.stack,
      required this.size,
      required this.onSelect});

  final List<double> stack;
  final Size size;
  final void Function(double) onSelect;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      width: size.width,
      decoration: BoxDecoration(
        color: Colors.teal[200],
        border: Border.all(color: Colors.black),
      ),
      child: ListView.builder(
          itemCount: stack.length,
          itemBuilder: (BuildContext context, index) {
            return Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.only(right: 10),
              height: 30,
              color: Colors.teal[400],
              child: InkWell(
                onTap: () {
                  onSelect(stack[index]);
                },
                child: Text('${stack[index]} \u21b4',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold)),
              ),
            );
          }),
    );
  }
}
