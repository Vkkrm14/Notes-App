


//this app is for creating a database and storing the contents in it


import 'package:flutter/material.dart';
import 'package:notes_app/model/note_database.dart';
import 'package:notes_app/themes/theme_provider.dart';
import 'package:provider/provider.dart';

import 'pages/notes_page.dart';

void main()async {
  //initialize note database
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDatabase.initialize();
  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (context)=> NoteDatabase()),
        ChangeNotifierProvider(create: (context)=> ThemeProvider()),
      ],
      child: const MyApp(),
  )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Notes(),
      theme: Provider.of<ThemeProvider>(context).themedata,
    );
  }
}
