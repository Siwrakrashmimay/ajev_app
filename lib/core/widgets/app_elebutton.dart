import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double? paddinghorizontal;
  final Color backgroundColor;

  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.paddinghorizontal,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(27.0),
        ),
        backgroundColor: backgroundColor,
        padding: EdgeInsets.symmetric(
            horizontal: paddinghorizontal ?? 130, vertical: 18),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 17, color: Colors.white),
      ),
    );
  }
}
