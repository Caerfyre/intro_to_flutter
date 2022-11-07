import 'package:bs_flutter_buttons/bs_flutter_buttons.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: Container(
        child: Center(
          child: Wrap(
            children: [
              BsButton(
                margin: EdgeInsets.only(right: 10.0, bottom: 0.0),
                onPressed: () {},
                style: BsButtonStyle.primary,
                size: BsButtonSize(
                  padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                ),
                prefixIcon: Icons.arrow_back,
                label: Text('Back'),
              ),
              BsButton(
                margin: EdgeInsets.only(right: 10.0, bottom: 10.0),
                onPressed: () {},
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
