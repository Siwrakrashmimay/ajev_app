// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../config/config.dart';

class OtpField extends StatefulWidget {
  final int length;
  final ValueChanged<String>? onChanged;
  final bool obscureText;

  const OtpField({
    super.key,
    this.length = 6,
    this.onChanged,
    this.obscureText = false,
  });

  @override
  _OtpFieldState createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> {
  late List<TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(widget.length, (_) => TextEditingController());
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(widget.length, (index) {
        return Container(
          width: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(23),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: TextFormField(
            controller: _controllers[index],
            textAlign: TextAlign.center,
            obscureText: widget.obscureText,
            style: Theme.of(context).textTheme.headlineSmall,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            maxLength: 1,
            onChanged: (value) {
              if (value.isNotEmpty && index < widget.length - 1) {
                FocusScope.of(context).nextFocus();
              }
              if (value.isEmpty && index > 0) {
                FocusScope.of(context).previousFocus();
              }

              // รวบรวมค่า OTP ที่กรอกจากทุกช่อง
              String otp =
                  _controllers.map((controller) => controller.text).join();
              if (widget.onChanged != null) {
                widget.onChanged!(otp); // ส่งค่า OTP กลับ
              }
            },
            decoration: InputDecoration(
              counterText: "",
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.instance.blues(context).withOpacity(0.25),
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(23),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.instance.blues(context).withOpacity(0.25),
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(23),
              ),
            ),
          ),
        );
      }),
    );
  }
}
