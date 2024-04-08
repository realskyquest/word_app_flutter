import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:word_app/provider/theme_provider.dart';

class HistoryListItem extends StatelessWidget {
  const HistoryListItem({
    super.key,
    required this.value,
  });

  final String value;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors =
        context.watch<ThemeProvider>().appTheme.colorScheme;

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
}
