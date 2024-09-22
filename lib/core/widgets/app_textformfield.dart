import 'package:flutter/material.dart';

import '../../config/app_colors.dart';

class ExtFormField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final bool isPassword;
  final ValueChanged<String>? onChanged;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final VoidCallback? onForgotPassword;

  const ExtFormField({
    super.key,
    this.hintText,
    this.controller,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onChanged,
    this.onForgotPassword,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
          obscureText: isPassword,
          keyboardType: keyboardType,
          style: const TextStyle(color: Colors.blue),
          validator: validator,
          onChanged: onChanged, // ใช้ validator ในการตรวจสอบข้อมูล
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle:
                const TextStyle(color: Color.fromARGB(255, 208, 207, 207)),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 193, 230, 249)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: AppColors.instance.blues(context)), //
            ),
            errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
            errorStyle: const TextStyle(color: Colors.red), // สีข้อความ error
            isDense: true, // ลดความสูงของ TextFormField
            contentPadding: const EdgeInsets.symmetric(vertical: 0),
          ),
        ),
        if (isPassword && onForgotPassword != null)
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: onForgotPassword,
              child: Text(
                'ลืมรหัสผ่าน',
                style: TextStyle(
                  color: AppColors.instance.blues(context),
                  fontSize: 12,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
