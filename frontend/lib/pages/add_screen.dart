import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:english_words/english_words.dart';
import 'package:word_app/components/add_screen_word_display.dart';
import 'package:word_app/models/saves.dart';

import 'package:provider/provider.dart';
import 'package:word_app/provider/theme_provider.dart';
import 'package:word_app/provider/add_screen_provider.dart';
import 'package:word_app/provider/history_screen_provider.dart';
import 'package:word_app/provider/saved_screen_provider.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors =
        context.watch<ThemeProvider>().appTheme.colorScheme;

    final wordProvider = context.watch<AddScreenProvider>();

    final ListTile listTile = ListTile(
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
    );

    final Row buttons = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          onPressed: () {
            final String newWord = WordPair.random(safeOnly: true).first;
            wordProvider.setWord(newWord);
            context.read<AddScreenProvider>().setWord(newWord);
            context.read<HistoryScreenProvider>().addWord(newWord);
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
            if (wordProvider.word != '') {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text("New word added, ${wordProvider.word}"),
                    duration: const Duration(milliseconds: 500),
                    action: SnackBarAction(label: 'Close', onPressed: () {})),
              );

              final SavesModel newSave = SavesModel(
                id: DateTime.now().toUtc().toString(),
                word: wordProvider.word,
              );
              context.read<SavedScreenProvider>().addSave(newSave);
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

    return Scaffold(
      body: Center(
        child: Card(
          color: appColors.surfaceVariant,
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              listTile,
              AddScreenWordDisplay(word: wordProvider.word),
              const Gap(5),
              buttons,
              const Gap(5),
            ],
          ),
        ),
      ),
    );
  }
}
