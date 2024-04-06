import 'package:flutter/material.dart';
import 'package:word_app/components/semicircle_scrollbar.dart';

import 'package:provider/provider.dart';
import 'package:word_app/provider/theme_provider.dart';
import 'package:word_app/provider/history_page_provider.dart';

Widget _scrollItem(BuildContext context, int index, String value, int length) {
  final ColorScheme appColors =
      context.watch<ThemeProvider>().appTheme.colorScheme;

  return Container(
    decoration: BoxDecoration(
      color: appColors.surfaceVariant,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
    ),
    margin: const EdgeInsets.all(4),
    child: Center(
      child: Text(
        style: TextStyle(color: appColors.onSurfaceVariant),
        value,
      ),
    ),
  );
}

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController semicircleController = ScrollController();

    if (context.watch<HistoryPageProvider>().list.isNotEmpty) {
      final List<String> list = context.watch<HistoryPageProvider>().list;

      return Scaffold(
        body: SemicircleScrollbar(
          controller: semicircleController,
          crossAxisCount: 5,
          list: list,
          child: _scrollItem,
        ),
      );
    } else {
      return const Scaffold(
        body: Center(
          child: Text('No History'),
        ),
      );
    }
  }
}
