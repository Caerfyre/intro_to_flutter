import 'package:flutter/material.dart';

class CustButton extends StatelessWidget {
  final String labelText;
  final IconData iconData;
  final VoidCallback onPress;

  CustButton({
    required this.labelText,
    required this.iconData,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(double.maxFinite, 50),
      ),
      onPressed: onPress,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconData),
          const SizedBox(
            width: 10.0,
          ),
          Text(
            labelText,
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
