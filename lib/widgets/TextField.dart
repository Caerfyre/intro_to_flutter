import 'package:flutter/material.dart';

class TextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final TextInputType textInputType;

  TextField(
      {required this.labelText,
      required this.hintText,
      required this.controller,
      required this.textInputType});

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
    );
  }
}
