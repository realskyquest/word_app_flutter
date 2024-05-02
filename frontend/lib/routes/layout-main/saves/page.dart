import 'package:flutter/material.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:word_app/provider/theme_provider.dart';

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

    return Consumer2<ThemeProvider, SavesProvider>(builder: (
      BuildContext context,
      ThemeProvider themeProvider,
      SavesProvider savesProvider,
      Widget? child,
    ) {
      logger.i('SavesPage Consumer');

      if (savesProvider.saves.isNotEmpty) {
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

        return Scaffold(
          body: DraggableScrollbar.semicircle(
            controller: semicircleController,
            child: ListView.builder(
              controller: semicircleController,
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
          ),
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
