import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:provider/provider.dart';
import 'package:word_app/provider/theme_provider.dart';
import 'package:word_app/provider/saved_screen_provider.dart';

class SaveListItem extends StatelessWidget {
  const SaveListItem({
    super.key,
    required this.value,
    required this.id,
    required this.length,
    required this.index,
  });

  final String id;
  final String value;
  final int length;
  final int index;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors =
        context.watch<ThemeProvider>().appTheme.colorScheme;

    final BoxDecoration decoration = BoxDecoration(
      color: appColors.surfaceVariant,
      borderRadius: const BorderRadius.all(Radius.circular(5)),
    );

    return InkWell(
      onTapDown: (details) {},
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      child: Dismissible(
        key: Key(id),
        onDismissed: (direction) {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Saved word removed, $value"),
              showCloseIcon: true,
            ),
          );
          
          context.read<SavedScreenProvider>().removeSave(length - 1 - index);
        },
        child: Container(
          decoration: decoration,
          margin: const EdgeInsets.only(top: 4, bottom: 4),
          child: Column(
            children: [
              const Gap(5),
              Text(
                style: TextStyle(color: appColors.onSurfaceVariant),
                value,
              ),
              const Gap(5),
            ],
          ),
        ),
      ),
    );
  }
}
