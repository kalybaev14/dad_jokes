import 'dart:developer';

import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;
  String bgImage='assets/images/dartvaider.png';
  String iconImage='assets/images/moon.png';
  Color containerColor=Colors.white.withOpacity(0.35);
  void changeTheme({required bool dark}) {
    if (dark) {
      themeMode = ThemeMode.light;
      containerColor= Colors.black.withOpacity(0.35);
      bgImage='assets/images/luck.png';
      iconImage='assets/images/sun.png';
    } else {
      themeMode = ThemeMode.dark;
      containerColor=Colors.white.withOpacity(0.35);
      bgImage='assets/images/dartvaider.png';
      iconImage='assets/images/moon.png';
    }
    notifyListeners();
  }
}
