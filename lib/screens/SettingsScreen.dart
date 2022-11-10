import 'package:flutter/material.dart';
import 'package:intro_to_flutter/screens/LoginScreen.dart';
import 'package:intro_to_flutter/widgets/CustButton.dart';

class SettingsScreen extends StatefulWidget {
  static String routeName = "/settings";
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsState();
}

class _SettingsState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: const Text("Settings"), elevation: 10.0),
      body: Center(
        child: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: screenWidth * .9,
              child: Column(
                children: [
                  CustButton(
                    labelText: "Logout",
                    iconData: Icons.logout,
                    onPress: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          LoginScreen.routeName,
                          (Route<dynamic> route) => false);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
