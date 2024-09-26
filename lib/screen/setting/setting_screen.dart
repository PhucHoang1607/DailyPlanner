import 'package:daily_planner/utilities/change_theme.dart';
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
    final themeModeChange = Provider.of<ThemeUtilities>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // width: 200,
              // height: 200,
              margin: const EdgeInsets.only(left: 20, right: 20),
              decoration: const BoxDecoration(
                border:
                    Border(bottom: BorderSide(width: 2, color: Colors.black)),
              ),
              padding: const EdgeInsets.all(2),
              child: Row(
                children: [
                  FaIcon(themeModeChange.themeMode != ThemeMode.dark
                      ? Icons.wb_sunny_outlined
                      : FontAwesomeIcons.moon),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: SwitchListTile(
                        title: themeModeChange.themeMode != ThemeMode.dark
                            ? const Text('Dark Mode')
                            : const Text('Light Mode'),
                        value: themeModeChange.themeMode == ThemeMode.dark,
                        onChanged: (value) {
                          themeModeChange.toggleTheme(value);
                        }),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
