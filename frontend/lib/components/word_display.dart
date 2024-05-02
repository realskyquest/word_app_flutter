import 'package:flutter/material.dart';
import 'package:word_app/provider/theme_provider.dart';

Container wordDisplay(ThemeProvider themeProvider, String word) {
  final ColorScheme appColors = themeProvider.appTheme.colorScheme;

  return Container(
    margin: const EdgeInsets.only(left: 40, right: 40, bottom: 10),
    decoration: BoxDecoration(
      color: appColors.onSurfaceVariant,
      borderRadius: const BorderRadius.all(Radius.circular(20)),
    ),
    child: Center(
      child: Text(
        style: TextStyle(
          fontSize: 20,
          color: appColors.surface,
        ),
        word,
      ),
    ),
  );
}
