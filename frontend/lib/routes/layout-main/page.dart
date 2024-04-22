import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:word_app/utils/logger.dart';
import 'package:english_words/english_words.dart';
import 'package:word_app/components/word_display.dart';

import 'package:provider/provider.dart';
import 'package:word_app/provider/theme_provider.dart';
import 'package:word_app/provider/add_provider.dart';
import 'package:word_app/provider/history_provider.dart';
import 'package:word_app/provider/saves_provider.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    logger.t('AddPage Class');

    return Consumer4<ThemeProvider, AddProvider, HistoryProvider,
        SavesProvider>(
      builder: (
        BuildContext context,
        ThemeProvider themeProvider,
        AddProvider addProvider,
        HistoryProvider historyProvider,
        SavesProvider savesProvider,
        Widget? child,
      ) {
        logger.i('AddPage Consumer');

        final ColorScheme appColors = themeProvider.appTheme.colorScheme;

        return Scaffold(
          body: Center(
            child: Card(
              color: appColors.surfaceVariant,
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: _cardItems(context, themeProvider, addProvider,
                  historyProvider, savesProvider),
            ),
          ),
        );
      },
    );
  }
}

Column _cardItems(
  BuildContext context,
  ThemeProvider themeProvider,
  AddProvider addProvider,
  HistoryProvider historyProvider,
  SavesProvider savesProvider,
) {
  final ColorScheme appColors = themeProvider.appTheme.colorScheme;

  return Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      ListTile(
        leading: Icon(
          Icons.abc,
          color: appColors.onSurfaceVariant,
          size: 60,
        ),
        title: Text(
          style: TextStyle(
            color: appColors.onSurfaceVariant,
            fontWeight: FontWeight.bold,
          ),
          'Make new word',
        ),
        subtitle: Text(
          style: TextStyle(
            color: appColors.onSurfaceVariant,
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
          'Click to make new word',
        ),
      ),
      WordDisplay(word: addProvider.word),
      const Gap(5),
      _cardButtons(
          context, themeProvider, addProvider, historyProvider, savesProvider),
      const Gap(5),
    ],
  );
}

Row _cardButtons(
  BuildContext context,
  ThemeProvider themeProvider,
  AddProvider addProvider,
  HistoryProvider historyProvider,
  SavesProvider savesProvider,
) {
  final ColorScheme appColors = themeProvider.appTheme.colorScheme;

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      ElevatedButton(
        onPressed: () {
          final String newWord = WordPair.random(safeOnly: true).first;
          addProvider.setWord(newWord);
          historyProvider.addWord(newWord);
          logger.t('New word generated: $newWord');
        },
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(appColors.tertiaryContainer),
          surfaceTintColor: MaterialStateProperty.all(appColors.shadow),
        ),
        child: Text(
          style: TextStyle(
            color: appColors.onTertiaryContainer,
          ),
          'Make',
        ),
      ),
      const Gap(10),
      TextButton(
        onPressed: () {
          if (addProvider.word != '') {
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Added new word, ${addProvider.word}'),
                showCloseIcon: true,
              ),
            );

            savesProvider.addSave(addProvider.word);
          } else {
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Make new word first!'),
                showCloseIcon: true,
              ),
            );

            logger.d('Make new word first!');
          }
        },
        child: Text(
          style: TextStyle(
            color: appColors.onSurfaceVariant,
          ),
          'Save',
        ),
      ),
    ],
  );
}
