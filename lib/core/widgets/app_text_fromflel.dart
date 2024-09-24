import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final bool isPassword;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? suffixIcon; // To add the "Send" button

  const AppTextFormField({
    super.key,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.onChanged,
    this.controller,
    this.validator,
    this.suffixIcon, // Added suffixIcon parameter
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isPassword,
      onChanged: onChanged,
      validator: validator,
      style: const TextStyle(color: Color(0xFFA9A9A9)),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Color(0xFFA9A9A9)),
        suffixIcon: suffixIcon, // Add the suffix icon here
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFA9A9A9), width: 1.0),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 1.0),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.0),
        ),
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.0),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
      ),
    );
  }
}
