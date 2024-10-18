import 'package:flutter/material.dart';

class CustomeTextFormField extends StatelessWidget {
  const CustomeTextFormField({
    Key? key,
    this.labelText,
    required this.borderColor,
    required this.focusedBorderColor,
    this.hintText,
    this.textInputAction,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
  }) : super(key: key);

  final String? labelText;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final String? hintText;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      obscureText: obscureText!,
      decoration: InputDecoration(
        labelText: labelText, // Label Text tùy chọn
        hintText: hintText, // Hiển thị hintText nếu không có labelText

        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(
            color: borderColor!, // Màu viền khi chưa focus
            width: 1.0,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(
            color: focusedBorderColor!, // Màu viền khi focus
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
