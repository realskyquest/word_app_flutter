import 'package:flutter/material.dart';
import 'package:word_app/components/curved_bottom_navigation_bar.dart';
import 'package:gap/gap.dart';

import 'package:go_router/go_router.dart';
import 'package:word_app/utils/logger.dart';
import 'package:word_app/collections/routes.dart';

import 'package:provider/provider.dart';
import 'package:word_app/provider/theme_provider.dart';
import 'package:word_app/provider/bottom_navigation_bar_provider.dart';

class LayoutMain extends StatelessWidget {
  const LayoutMain({super.key, required this.page});

  final Widget page;

  @override
  Widget build(BuildContext context) {
    logger.t('LayoutMain Class');

    return Consumer2<BottomNavigationBarProvider, ThemeProvider>(
      builder: (
        BuildContext context,
        BottomNavigationBarProvider bottomNavigationBarProvider,
        ThemeProvider themeProvider,
        Widget? child,
      ) {
        logger.i('LayoutMain Consumer');

        final ColorScheme appColors = themeProvider.appTheme.colorScheme;
        final int currentBottomNavigationIndex = bottomNavigationBarProvider
            .currentRouteIndex(layoutMainPaths, context);

        return Scaffold(
          appBar: _rootAppBar(context, themeProvider),
          body: page,
          bottomNavigationBar: Container(
            color: appColors.secondaryContainer,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Gap(20),
                CurvedBottomNavigationBar(
                  currentIndex: currentBottomNavigationIndex,
                ),
              ],
            ),
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
          GoRouter.of(context).push('/account');
        },
        icon: Icon(
          Icons.account_box,
          color: appColors.onTertiaryContainer,
        ),
      ),
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
