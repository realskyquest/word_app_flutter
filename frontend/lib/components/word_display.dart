import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:word_app/provider/theme_provider.dart';

class WordDisplay extends StatelessWidget {
  const WordDisplay({super.key, required this.word});

  final String word;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (
        BuildContext context,
        ThemeProvider themeProvider,
        Widget? child,
      ) {
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
      },
    );
  }
}
