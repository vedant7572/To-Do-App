import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  MyButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Text(text),
      style: OutlinedButton.styleFrom(
        side: BorderSide( width: 2.0), // Border color and width
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0), // Padding
        textStyle: TextStyle(fontSize: 16), // Text style
      ),
    );
  }
}
