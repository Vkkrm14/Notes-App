import 'package:flutter/material.dart';
import 'package:notes_app/themes/theme.dart';
class ThemeProvider with ChangeNotifier{
  ThemeData _themeData = lightmode;
  ThemeData get themedata=>_themeData;
  bool get isDarkMode=> _themeData==darkmode;

  set themedata(ThemeData themedata){
    _themeData=themedata;
    notifyListeners();
  }
  void toggleTheme(){
   if (_themeData==lightmode){
      themedata=darkmode;
    }
   else{
     themedata=lightmode;
   }
  }



}