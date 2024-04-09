import 'package:flutter/material.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:gap/gap.dart';

import 'package:word_app/components/save_list_item.dart';
import 'package:word_app/models/saves.dart';

import 'package:provider/provider.dart';
import 'package:word_app/provider/saved_screen_provider.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController semicircleController = ScrollController();

    return Scaffold(
      body: Consumer<SavedScreenProvider>(
        builder: (BuildContext context, SavedScreenProvider savedScreenProvider,
            Widget? child) {
          if (savedScreenProvider.saves.isNotEmpty) {
            return _SavedScreenListView(controller: semicircleController);
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

class _SavedScreenListView extends StatelessWidget {
  const _SavedScreenListView({required this.controller});

  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    final List<SavesModel> list = context.watch<SavedScreenProvider>().saves;

    return DraggableScrollbar.semicircle(
      controller: controller,
      child: ListView.builder(
        controller: controller,
        padding: EdgeInsets.zero,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(left: 6, right: 34),
            child: SaveListItem(
              id: list.reversed.toList()[index].id,
              value: list.reversed.toList()[index].word,
              length: list.length,
              index: index,
            ),
          );
        },
      ),
    );
  }
}
