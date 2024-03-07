import 'package:flutter/material.dart';

class StackView extends StatefulWidget {
  const StackView({super.key, required this.stack, required this.size});

  final List<double> stack;
  final Size size;

  @override
  State<StackView> createState() => _StackViewState();
}

class _StackViewState extends State<StackView> {
  final _listViewController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      width: widget.size.width,
      //height: 160,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.amber,
        border: Border.all(color: Colors.black),
      ),
      child: ListView.builder(
        itemCount: widget.stack.length,
        controller: _listViewController,
        itemBuilder: (BuildContext context, index) {
          return Container(
              alignment: Alignment.bottomRight,
              height: 24,
              color: Colors.amber,
              child: Text(
                '${widget.stack[index]}',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ));
        },
      ),
    );
  }
}
