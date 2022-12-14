import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final bool obscureText;
  final VoidCallback onTap;
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final String errorText;
  final String? confirmVal;

  PasswordField(
      {required this.obscureText,
      required this.onTap,
      required this.labelText,
      required this.hintText,
      required this.controller,
      required this.errorText,
      this.confirmVal});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 12,
              right: 15,
              bottom: 10,
            ),
            child: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
          ),
        ),
        labelText: labelText,
        hintText: hintText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return errorText;
        }
        if (confirmVal != null && value != confirmVal) {
          return "Passwords do not match";
        }
        return null;
      },
    );
  }
}
