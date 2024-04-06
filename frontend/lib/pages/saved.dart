import 'package:flutter/material.dart';
import 'package:word_app/components/semicircle_scrollbar.dart';
import 'package:gap/gap.dart';

import 'package:provider/provider.dart';
import 'package:word_app/provider/theme_provider.dart';
import 'package:word_app/provider/saved_page_provider.dart';

Widget _scrollItem(BuildContext context, int index, String value, int length) {
  final ColorScheme appColors =
      context.watch<ThemeProvider>().appTheme.colorScheme;

  return Container(
    margin: const EdgeInsets.all(4.0),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: appColors.surfaceVariant,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const Gap(10),
        Text(
          style: TextStyle(
            color: appColors.onSurfaceVariant,
          ),
          value,
        ),
        IconButton(
          onPressed: () {
            context.read<SavedPageProvider>().removeWord(length - 1 - index);
          },
          icon: const Icon(Icons.delete),
        ),
      ],
    ),
  );
}

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController semicircleController = ScrollController();

    List<String> list = context.watch<SavedPageProvider>().list;
    List<String> reversedList = list.reversed.toList();

    if (list.isNotEmpty) {
      return Scaffold(
        body: SemicircleScrollbar(
          controller: semicircleController,
          crossAxisCount: 4,
          list: reversedList,
          child: _scrollItem,
        ),
      );
    } else {
      return const Scaffold(
        body: Center(
          child: Text('Nothing saved'),
        ),
      );
    }
  }
}
