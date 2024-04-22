import 'package:flutter/material.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';

import 'package:word_app/utils/logger.dart';
import 'package:word_app/components/save_list_item.dart';
import 'package:word_app/models/saves.dart';

import 'package:provider/provider.dart';
import 'package:word_app/provider/saves_provider.dart';

class SavesPage extends StatelessWidget {
  const SavesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController semicircleController = ScrollController();

    logger.t('SavesPage Class');

    return Consumer<SavesProvider>(builder: (
      BuildContext context,
      SavesProvider savesProvider,
      Widget? child,
    ) {
      logger.i('SavesPage Consumer');

      if (savesProvider.saves.isNotEmpty) {
        return Scaffold(
          body: _SavesPageListView(controller: semicircleController),
        );
      } else {
        return const Scaffold(
          body: Center(
            child: Text('Nothing saved!'),
          ),
        );
      }
    });
  }
}

class _SavesPageListView extends StatelessWidget {
  const _SavesPageListView({required this.controller});

  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return Consumer<SavesProvider>(
      builder: (
        BuildContext context,
        SavesProvider savesProvider,
        Widget? child,
      ) {
        final List<SavesModel> list = savesProvider.saves;

        logger.d(
          [
            'SavesPage list',
            {
              'list': list,
              'length': list.length,
            },
          ],
        );

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
      },
    );
  }
}
