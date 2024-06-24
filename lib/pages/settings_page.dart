import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(12)),
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Dark mode",
                style: TextStyle(
                    fontSize: 25,
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold),
              ),
              CupertinoSwitch(
                  value: Provider.of<ThemeProvider>(context, listen: false)
                      .isDarkMode,
                  onChanged: (value) =>
                      Provider.of<ThemeProvider>(context, listen: false)
                          .toggleTheme())
            ],
          ),
      ),

    );
  }
}
