import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:word_app/themes/theme.dart';

final _appLightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: MaterialTheme.lightScheme().toColorScheme());
final _appDarkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: MaterialTheme.darkScheme().toColorScheme());

class ThemeProvider with ChangeNotifier, DiagnosticableTreeMixin {
  ThemeData _appTheme = _appLightTheme;
  bool _appDarkMode = false;

  get appTheme => _appTheme;
  get appDarkMode => _appDarkMode;

  void changeTheme(bool mode) {
    if (mode == true) {
      _appTheme = _appDarkTheme;
    } else {
      _appTheme = _appLightTheme;
    }

    _appDarkMode = mode;
    notifyListeners();
  }

  // Take care of later
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('theme', appTheme));
  }
}
