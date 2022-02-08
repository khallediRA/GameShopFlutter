import 'package:flutter/cupertino.dart';

class ScreenTheme with ChangeNotifier {
  ThemeBrightness theme = ThemeBrightness.DARK;
  ThemeBrightness get getTheme => this.theme;

  changeTheme() {
    if (this.theme == ThemeBrightness.DARK) {
      this.theme = ThemeBrightness.LIGHT;
    } else {
      this.theme = ThemeBrightness.DARK;
    }
    notifyListeners();
  }
}

enum ThemeBrightness { DARK, LIGHT }
