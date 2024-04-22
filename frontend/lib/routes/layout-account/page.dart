import 'package:flutter/material.dart';

import 'package:pocketbase/pocketbase.dart';
import 'package:word_app/utils/check_server.dart';
import 'package:word_app/utils/logger.dart';

import 'package:provider/provider.dart';
import 'package:word_app/provider/pocketbase_provider.dart';
import 'package:word_app/provider/theme_provider.dart';
import 'package:word_app/provider/saves_provider.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    logger.t('AccountPage Class');

    return Consumer2<ThemeProvider, PocketbaseProvider>(
      builder: (BuildContext context, ThemeProvider themeProvider,
          PocketbaseProvider pocketbaseProvider, Widget? child) {
        logger.i('AccountPage Consumer');

        final ColorScheme appColors = themeProvider.appTheme.colorScheme;

        return Scaffold(
          appBar: _rootAppBar(context, themeProvider),
          body: Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                  if (await isServerRunningUtil()) {
                    logger.d('Server is running');

                    pocketbaseProvider.changeServerStatus(true);
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).removeCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Server is running'),
                          showCloseIcon: true,
                        ),
                      );
                    }
                  } else {
                    logger.d('Server is not running');

                    pocketbaseProvider.changeServerStatus(false);
                    if (context.mounted) {                      
                      ScaffoldMessenger.of(context).removeCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Server is not running'),
                          showCloseIcon: true,
                        ),
                      );
                    }
                  }
                },
                child: const Text('Check server status'),
              ),
              _serverStatusDisplay(pocketbaseProvider),
              const Text('Coming soon'),
            ],
          ),
        );
      },
    );
  }
}

AppBar _rootAppBar(BuildContext context, ThemeProvider themeProvider) {
  final bool appDarkMode = themeProvider.appDarkMode;
  final ColorScheme appColors = themeProvider.appTheme.colorScheme;

  return AppBar(
    backgroundColor: appColors.tertiaryContainer,
    title: Text(
      style: TextStyle(
        color: appColors.onTertiaryContainer,
      ),
      'Word App',
    ),
    actions: <Widget>[
      IconButton(
        onPressed: () {
          if (appDarkMode == true) {
            themeProvider.changeTheme(false);
          } else {
            themeProvider.changeTheme(true);
          }
        },
        icon: _currentThemeIcon(themeProvider),
      ),
    ],
  );
}

Icon _currentThemeIcon(ThemeProvider themeProvider) {
  final bool appDarkMode = themeProvider.appDarkMode;
  final ColorScheme appColors = themeProvider.appTheme.colorScheme;

  return Icon(
    appDarkMode == true ? Icons.wb_sunny : Icons.mode_night,
    color: appDarkMode == true ? appColors.primary : appColors.onSurface,
  );
}

Text _serverStatusDisplay(PocketbaseProvider pocketbaseProvider) {
  if (pocketbaseProvider.serverIsRunning == true) {
    return const Text('Server is running');
  } else {
    return const Text('Server is not running');
  }
}