import 'package:flutter/material.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';

import 'package:word_app/utils/logger.dart';
import 'package:word_app/components/history_list_item.dart';

import 'package:provider/provider.dart';
import 'package:word_app/provider/history_provider.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController semicircleController = ScrollController();

    logger.t('HistoryPage Class');

    return Consumer<HistoryProvider>(
      builder: (
        BuildContext context,
        HistoryProvider historyProvider,
        Widget? child,
      ) {
        logger.i('HistoryPage Consumer');

        if (historyProvider.list.isNotEmpty) {
          return Scaffold(
            body: _HistoryPageListView(controller: semicircleController),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: Text('History is empty!'),
            ),
          );
        }
      },
    );
  }
}

class _HistoryPageListView extends StatelessWidget {
  const _HistoryPageListView({required this.controller});

  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    final List<String> list = context.watch<HistoryProvider>().list;

    logger.d(
      [
        'HistoryPage list',
        {
          'list': list,
          'length': list.length,
        },
      ],
    );

    return DraggableScrollbar.semicircle(
      controller: controller,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
        ),
        controller: controller,
        padding: EdgeInsets.zero,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return HistoryListItem(value: list[index]);
        },
      ),
    );
  }
}
