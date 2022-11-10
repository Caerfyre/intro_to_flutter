import 'package:bs_flutter_buttons/bs_flutter_buttons.dart';
import 'package:flutter/material.dart';
import 'package:intro_to_flutter/screens/LoginScreen.dart';

class SettingsScreen extends StatefulWidget {
  static String routeName = "/settings";
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsState();
}

class _SettingsState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: Container(
        child: Center(
          child: Wrap(
            children: [
              BsButton(
                margin: EdgeInsets.only(right: 10.0, bottom: 10.0),
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      LoginScreen.routeName, (Route<dynamic> route) => false);
                },
                style: BsButtonStyle.primary,
                size: BsButtonSize(
                  padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                ),
                prefixIcon: Icons.logout,
                label: Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
