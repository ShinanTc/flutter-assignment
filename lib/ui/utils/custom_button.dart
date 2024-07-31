import 'package:flutter/material.dart';
import '../../values/values.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onPressed});
  final String text; // Add a string property to hold the button text
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
