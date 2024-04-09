import 'package:flutter/material.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:gap/gap.dart';

import 'package:word_app/components/history_list_item.dart';

import 'package:provider/provider.dart';
import 'package:word_app/provider/history_screen_provider.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController semicircleController = ScrollController();

    return Scaffold(
      body: Consumer<HistoryScreenProvider>(
        builder: (BuildContext context,
            HistoryScreenProvider historyScreenProvider, Widget? child) {
          if (historyScreenProvider.list.isNotEmpty) {
            return _HistoryScreenListView(controller: semicircleController);
          } else {
            return const Center(
              child: Text('Nothing saved'),
            );
          }
        },
      ),
    );
  }
}

class _HistoryScreenListView extends StatelessWidget {
  const _HistoryScreenListView({required this.controller});

  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    final List<String> list = context.watch<HistoryScreenProvider>().list;

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
