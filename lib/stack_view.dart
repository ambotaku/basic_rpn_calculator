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
        color: Colors.amber,
        border: Border.all(color: Colors.black),
      ),
      child: Scrollbar(
        trackVisibility: true,
        thickness: 20,
        radius: const Radius.circular(20),
        //interactive: true,
        child: ListView.builder(
          itemCount: stack.length,
          itemBuilder: (BuildContext context, index) {
            return Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.only(right: 30),
                height: 24,
                color: Colors.amber,
                child: TextButton(
                  onPressed: () {
                    onSelect(stack[index]);
                  },
                  //style: ButtonStyle(),
                  child: Text(
                    '${stack[index]}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ));
          },
        ),
      ),
    );
  }
}
