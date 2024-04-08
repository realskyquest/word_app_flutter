import 'package:flutter/material.dart';

import 'dart:convert';

import 'package:provider/provider.dart';
import 'package:word_app/provider/theme_provider.dart';
import 'package:word_app/provider/saved_screen_provider.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bool appDarkMode = context.watch<ThemeProvider>().appDarkMode;
    final ColorScheme appColors =
        context.watch<ThemeProvider>().appTheme.colorScheme;

    final List<Widget> accountAppActions = <Widget>[
      IconButton(
        onPressed: () {
          if (appDarkMode == true) {
            context.read<ThemeProvider>().changeTheme(false);
          } else {
            context.read<ThemeProvider>().changeTheme(true);
          }
        },
        icon: const ThemeIcon(),
      ),
    ];
    
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: appColors.onTertiaryContainer),
        backgroundColor: appColors.tertiaryContainer,
        title: Text(style: TextStyle(color: appColors.onTertiaryContainer), 'Account'),
        actions: accountAppActions,
      ),
      body: const Center(
        child: Text('Coming soon'),
      ),
    );
  }
}

class ThemeIcon extends StatelessWidget {
  const ThemeIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final bool appDarkMode = context.watch<ThemeProvider>().appDarkMode;
    final ColorScheme appColors =
        context.watch<ThemeProvider>().appTheme.colorScheme;

    if (appDarkMode == true) {
      return Icon(Icons.wb_sunny, color: appColors.primary);
    } else {
      return Icon(Icons.mode_night, color: appColors.onSurface);
    }
  }
}


class AccountPanel extends StatelessWidget {
  const AccountPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
