import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:word_app/collections/routes.dart';

import 'package:provider/provider.dart';
import 'package:word_app/provider/theme_provider.dart';
import 'package:word_app/provider/bottom_navigation_bar_provider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class CurvedBottomNavigationBar extends StatelessWidget {
  const CurvedBottomNavigationBar({
    super.key,
    required this.currentIndex,
  });

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Consumer2<BottomNavigationBarProvider, ThemeProvider>(
      builder: (
        BuildContext context,
        BottomNavigationBarProvider bottomNavigationBarProvider,
        ThemeProvider themeProvider,
        Widget? child,
      ) {
        final ColorScheme appColors = themeProvider.appTheme.colorScheme;

        return CurvedNavigationBar(
          backgroundColor: appColors.secondaryContainer,
          color: appColors.tertiaryContainer,
          buttonBackgroundColor: appColors.primaryContainer,
          items: <Widget>[
            _CurvedBottomNavigationBarIcon(
              currentIndex: currentIndex,
              icon: Icons.add,
              idx: 0,
              label: 'Add',
            ),
            _CurvedBottomNavigationBarIcon(
              currentIndex: currentIndex,
              icon: Icons.history,
              idx: 1,
              label: 'History',
            ),
            _CurvedBottomNavigationBarIcon(
              currentIndex: currentIndex,
              icon: Icons.save,
              idx: 2,
              label: 'Saved',
            ),
          ],
          index: currentIndex,
          onTap: (int idx) {
            bottomNavigationBarProvider.link(idx, layoutMainPaths, context);
          },
          animationDuration: const Duration(milliseconds: 300),
        );
      },
    );
  }
}

class _CurvedBottomNavigationBarIcon extends StatelessWidget {
  const _CurvedBottomNavigationBarIcon({
    required this.icon,
    required this.label,
    required this.idx,
    required this.currentIndex,
  });

  final int currentIndex;
  final int idx;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (
        BuildContext context,
        ThemeProvider themeProvider,
        Widget? child,
      ) {
        final ColorScheme appColors = themeProvider.appTheme.colorScheme;

        if (currentIndex == idx) {
          return Icon(
            icon,
            size: 30,
            color: appColors.onPrimaryContainer,
          );
        } else {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Gap(10),
              Icon(icon, size: 30, color: appColors.onPrimaryContainer),
              Text(
                style: TextStyle(color: appColors.onPrimaryContainer),
                label,
              ),
            ],
          );
        }
      },
    );
  }
}
