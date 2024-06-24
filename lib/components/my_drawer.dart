// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:notes_app/components/drawer_tile.dart';
import 'package:notes_app/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          DrawerHeader(child: Icon(Icons.note)),
          //notes tile
          DrawerTile(
              title: "Notes",
              leading: Icons.notes,
              onTap: () => Navigator.pop(context)),
          //settings tile
          DrawerTile(
              title: "Settings",
              leading: Icons.settings,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsPage()));
              }),
        ],
      ),
    );
  }
}
