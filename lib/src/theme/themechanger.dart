import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  //Por Default el theme estara en modo light
  bool _darkTheme = false;
  bool _customTheme = false;
  ThemeData _currentTheme = ThemeData.light();

  //Get para obtener las variables de la clase ThemeChanger
  bool get darkTheme => this._darkTheme;

  bool get customTheme => this._customTheme;

  ThemeData get currentTheme => this._currentTheme;

  //Constructor
  ThemeChanger(int theme) {
    switch (theme) {
      case 1: //theme == Light
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light().copyWith(accentColor: Colors.pink);
        break;

      case 2: // theme == Dark
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark().copyWith(accentColor: Colors.pink);
        break;

      case 3: // theme == Custom
        _darkTheme = false;
        _customTheme = true;
        break;

      default:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
    }
  }

  set darkTheme(bool value) {
    _customTheme = false;
    _darkTheme = value;

    if (value) {
      _currentTheme = ThemeData.dark().copyWith(accentColor: Colors.pink);
    } else {
      _currentTheme = ThemeData.light().copyWith(accentColor: Colors.pink);
    }

    notifyListeners();
  }

  set customTheme(bool value) {
    _customTheme = value;
    _darkTheme = false;

    if (value) {
      _currentTheme = ThemeData.dark().copyWith(
          accentColor: Color(0xff48A0EB),
          primaryColorLight: Colors.white,
          scaffoldBackgroundColor: Color(0xff16202B),
          textTheme: TextTheme(
            bodyText1: TextStyle(color: Colors.white),
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.purple.shade200));
    } else {
      _currentTheme = ThemeData.light();
    }

    notifyListeners();
  }
}
