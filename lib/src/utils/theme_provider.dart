import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance!.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColor: Colors.black,
    colorScheme: ColorScheme.dark(),
    accentColor: Colors.cyan,
    iconTheme: IconThemeData(color: Colors.purple.shade200, opacity: 0.8),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.white,
    colorScheme: ColorScheme.light(),
    accentColor: Colors.deepPurple.shade300,
    iconTheme: IconThemeData(color: Colors.red.shade200, opacity: 0.8),
  );
}

class MyColors {
  static final primaryColor = Color(0xFFE70D32);
  static final primaryColorDark = Color(0xFFA7001C);
  static final primaryOpacityColor = Color.fromRGBO(231, 13, 50, 0.09);

  static final green = Color(0xff20D0C4);
  static final dark = Color(0xFF03091E);
  static final grey = Color(0xff212738);
  static final ligthGrey = Color(0xffBBBBBB);
  static final veryLigthGrey = Color(0xfff3f3f3);
  static final white = Color(0xffffffff);
  static final pink = Color(0xfff5638b);
}
