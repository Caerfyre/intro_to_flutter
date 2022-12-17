import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class CustTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final TextInputType textInputType;
  final String errorText;

  CustTextField(
      {required this.labelText,
      required this.hintText,
      required this.controller,
      required this.textInputType,
      required this.errorText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      decoration: InputDecoration(
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
        if (labelText == "Email Address" &&
            EmailValidator.validate(value) == false) {
          return "Please enter a valid email address";
        }
        return null;
      },
    );
  }
}
