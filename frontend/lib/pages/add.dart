import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:english_words/english_words.dart';

import 'package:provider/provider.dart';
import 'package:word_app/provider/theme_provider.dart';
import 'package:word_app/provider/add_page_provider.dart';
import 'package:word_app/provider/history_page_provider.dart';
import 'package:word_app/provider/saved_page_provider.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors =
        context.watch<ThemeProvider>().appTheme.colorScheme;

    final wordProvider = context.watch<AddPageProvider>();

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
            context.read<AddPageProvider>().setWord(newWord);
            context.read<HistoryPageProvider>().addWord(newWord);
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
              context.read<SavedPageProvider>().addWord(wordProvider.word);
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
              const AddPageWordDisplay(),
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

class AddPageWordDisplay extends StatelessWidget {
  const AddPageWordDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors =
        context.watch<ThemeProvider>().appTheme.colorScheme;
    final String word = context.watch<AddPageProvider>().word;

    return Container(
      margin: const EdgeInsets.only(left: 40, right: 40, bottom: 10),
      decoration: BoxDecoration(
        color: appColors.onSurfaceVariant,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Center(
        child: Text(
          style: TextStyle(
            fontSize: 20,
            color: appColors.surface,
          ),
          word,
        ),
      ),
    );
  }
}
