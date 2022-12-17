import 'package:flutter/material.dart';
import 'package:intro_to_flutter/screens/LoginScreen.dart';
import 'package:intro_to_flutter/services/AuthService.dart';
import 'package:intro_to_flutter/services/StorageService.dart';
import 'package:intro_to_flutter/widgets/CustButton.dart';

class SettingsScreen extends StatefulWidget {
  static String routeName = "/settings";
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsState();
}

class _SettingsState extends State<SettingsScreen> {
  AuthService _authService = AuthService();
  StorageService _storageService = StorageService();
  bool showSpinner = false;

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
                    onPress: () async {
                      try {
                        setState(() {
                          showSpinner = true;
                        });
                        await _authService.logout();
                        await _storageService.deleteAllData();
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            LoginScreen.routeName,
                            (Route<dynamic> route) => false);
                      } catch (e) {
                        print(e);
                      }
                      setState(() {
                        showSpinner = false;
                      });
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
