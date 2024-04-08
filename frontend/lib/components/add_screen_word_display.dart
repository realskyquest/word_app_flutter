import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:word_app/provider/theme_provider.dart';

class AddScreenWordDisplay extends StatelessWidget {
  const AddScreenWordDisplay({super.key, required this.word});

  final String word;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors =
        context.watch<ThemeProvider>().appTheme.colorScheme;

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
}
