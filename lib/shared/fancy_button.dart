import 'package:flutter/material.dart';

class FancyButton extends StatelessWidget {
  final String text;
  final Function function;
  const FancyButton({
    super.key,
    required this.text,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => function(),
      child: Container(
        height: 45,
        width: 110,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.blue,
        ),
        child: Center(
            child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 18.5),
        )),
      ),
    );
  }
}
