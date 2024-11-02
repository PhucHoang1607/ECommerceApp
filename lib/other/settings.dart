import 'package:e_commerce_app_project/utilities/change_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    final themeModeChange = Provider.of<ThemeUltilities>(context);
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    var isDark = MediaQuery.of(context).platformBrightness;

    double fontSizeHeader = screenWidth * 0.065;
    double fontSizeNormal = screenWidth * 0.045;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
      ),
      body: Center(
          child: Container(
        margin: EdgeInsets.only(top: screenHeight * 0.4),
        child: Column(
          children: [
            Text(
              "Settings",
              style: TextStyle(
                  fontSize: fontSizeHeader, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                FaIcon(themeModeChange.themeMode != ThemeMode.dark
                    ? Icons.wb_sunny_outlined
                    : FontAwesomeIcons.moon),
                const SizedBox(
                  width: 25,
                ),
                Expanded(
                    child: SwitchListTile(
                  title: themeModeChange.themeMode != ThemeMode.dark
                      ? const Text('Dark Mode')
                      : const Text("Light Mode"),
                  value: themeModeChange.themeMode == ThemeMode.dark,
                  onChanged: (value) {
                    themeModeChange.toggleTheme(value);
                  },
                ))
              ],
            )
          ],
        ),
      )),
    ));
  }
}
