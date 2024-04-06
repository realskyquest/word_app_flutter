import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:word_app/themes/theme.dart';

final ThemeData _appLightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: MaterialTheme.lightScheme().toColorScheme());
final ThemeData _appDarkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: MaterialTheme.darkScheme().toColorScheme());

class ThemeProvider with ChangeNotifier, DiagnosticableTreeMixin {
  ThemeData _appTheme = _appLightTheme;
  bool _appDarkMode = false;

  ThemeData get appTheme => _appTheme;
  bool get appDarkMode => _appDarkMode;

  void changeTheme(bool mode) {
    if (mode == true) {
      _appTheme = _appDarkTheme;
    } else {
      _appTheme = _appLightTheme;
    }

    _appDarkMode = mode;
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<ThemeData>('appTheme', appTheme));
    properties.add(DiagnosticsProperty<bool>('appDarkMode', appDarkMode));
  }
}
