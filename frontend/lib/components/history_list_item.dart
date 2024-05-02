import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:word_app/provider/theme_provider.dart';

Widget historyListItem(ThemeProvider themeProvider, String value) {
  final ColorScheme appColors = themeProvider.appTheme.colorScheme;

  final BoxDecoration decoration = BoxDecoration(
    color: appColors.surfaceVariant,
    borderRadius: const BorderRadius.all(Radius.circular(10)),
  );

  return InkWell(
    onTapDown: (details) {},
    borderRadius: const BorderRadius.all(Radius.circular(10)),
    child: Container(
      decoration: decoration,
      margin: const EdgeInsets.all(4),
      child: Center(
        child: Text(
          style: TextStyle(color: appColors.onSurfaceVariant),
          value,
        ),
      ),
    ),
  );
}
