import 'package:flutter/material.dart';
import 'package:word_app/components/curved_bottom_navigation_bar.dart';
import 'package:gap/gap.dart';

import 'package:go_router/go_router.dart';

import 'package:provider/provider.dart';
import 'package:word_app/provider/theme_provider.dart';
import 'package:word_app/provider/bottom_navigation_bar_provider.dart';

class RootApp extends StatelessWidget {
  final Widget child;

  const RootApp({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final bool appDarkMode = context.watch<ThemeProvider>().appDarkMode;
    final ColorScheme appColors =
        context.watch<ThemeProvider>().appTheme.colorScheme;

    final int currentBottomNavigationIndex = context
        .watch<BottomNavigationBarProvider>()
        .currentRouteIndex(rootAppPaths, context);

    final Text rootAppTitle = Text(
        style: TextStyle(color: appColors.onTertiaryContainer), 'Word App');

    final List<Widget> rootAppActions = <Widget>[
      IconButton(
        onPressed: () {
          GoRouter.of(context).push('/account');
        },
        icon: Icon(Icons.account_box, color: appColors.onTertiaryContainer),
      ),
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
        backgroundColor: appColors.tertiaryContainer,
        title: rootAppTitle,
        actions: rootAppActions,
      ),
      body: child,
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
