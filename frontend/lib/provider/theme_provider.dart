import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:word_app/themes/theme.dart';
import 'package:hive_flutter/adapters.dart';

final ThemeData appLightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: MaterialTheme.lightScheme().toColorScheme());
final ThemeData appDarkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: MaterialTheme.darkScheme().toColorScheme());

late bool initialAppDarkMode;

class ThemeProvider with ChangeNotifier, DiagnosticableTreeMixin {
  ThemeData _appTheme = appLightTheme;
  bool _appDarkMode = initialAppDarkMode;

  ThemeData get appTheme => _appTheme;
  bool get appDarkMode => _appDarkMode;

  void changeTheme(bool mode) async {
    if (mode == true) {
      _appTheme = appDarkTheme;
    } else {
      _appTheme = appLightTheme;
    }

    _appDarkMode = mode;

    var box = await Hive.openBox('theme');
    await box.put('mode', mode);

    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<ThemeData>('appTheme', appTheme));
    properties.add(DiagnosticsProperty<bool>('appDarkMode', appDarkMode));
  }
}
