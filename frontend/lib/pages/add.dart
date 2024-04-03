import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:english_words/english_words.dart';

import 'package:provider/provider.dart';
import 'package:word_app/provider/theme_provider.dart';
import 'package:word_app/provider/add_page_word_display_provider.dart';
import 'package:word_app/provider/history_page_provider.dart';
import 'package:word_app/provider/saved_page_provider.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    String newWord = '';

    return Scaffold(
      body: Center(
        child: Card(
          color: context
              .watch<ThemeProvider>()
              .appTheme
              .colorScheme
              .surfaceVariant,
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.build_circle_outlined, size: 40),
                title: Text(
                    style: TextStyle(
                        color: context
                            .watch<ThemeProvider>()
                            .appTheme
                            .colorScheme
                            .primary,
                        fontWeight: FontWeight.bold),
                    'Make new word'),
                subtitle: const Text(
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                    'Click to make new word'),
              ),
              const AddPageWordDisplay(),
              const Gap(5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FilledButton(
                    onPressed: () {
                      newWord = WordPair.random(safeOnly: true).first;
                      context
                          .read<AddPageWordDisplayProvider>()
                          .setWord(newWord);
                      context.read<HistoryPageProvider>().addWord(newWord);
                    },
                    child: const Text('Make'),
                  ),
                  const Gap(10),
                  TextButton(
                    onPressed: () {
                      if (newWord != '') {
                        context.read<SavedPageProvider>().addWord(newWord);
                      }
                    },
                    child: const Text(
                        style: TextStyle(color: Colors.black), 'Save'),
                  ),
                ],
              ),
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
    return Container(
      margin: const EdgeInsets.only(left: 40, right: 40, bottom: 8),
      child: Center(
        child: Text(style: const TextStyle(fontSize: 20), '${context.watch<AddPageWordDisplayProvider>().word}'),
      ),
    );
  }
}
