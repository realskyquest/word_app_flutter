import 'package:flutter/material.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';

import 'package:provider/provider.dart';
import 'package:word_app/provider/theme_provider.dart';
import 'package:word_app/provider/saved_page_provider.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController semicircleController = ScrollController();

    if (context.watch<SavedPageProvider>().list.length > 0) {
      return Scaffold(
        body: SemicircleScrollBar(
          controller: semicircleController,
          wordCount: context.watch<SavedPageProvider>().list.length,
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

class SemicircleScrollBar extends StatelessWidget {
  final ScrollController controller;
  final int wordCount;

  const SemicircleScrollBar({
    super.key,
    required this.controller,
    required this.wordCount,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollbar.semicircle(
      controller: controller,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
        ),
        controller: controller,
        padding: EdgeInsets.zero,
        itemCount: wordCount,
        itemBuilder: (context, index) {
          List<String> list = context.watch<SavedPageProvider>().list;
          List<String> reversedList = list.reversed.toList();

          return Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(2.0),
            color: context
                .watch<ThemeProvider>()
                .appTheme
                .colorScheme
                .tertiaryContainer,
            child: Text(
                style: TextStyle(
                    color: context
                        .watch<ThemeProvider>()
                        .appTheme
                        .colorScheme
                        .onTertiaryContainer),
                reversedList[index]),
          );
        },
      ),
    );
  }
}
