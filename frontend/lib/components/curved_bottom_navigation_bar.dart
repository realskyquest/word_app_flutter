import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:provider/provider.dart';
import 'package:word_app/provider/theme_provider.dart';
import 'package:word_app/provider/bottom_navigation_bar_provider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

const Map<String, int> rootAppPaths = {
  "/": 0,
  "/history": 1,
  "/saved": 2,
  "/account": 3,
};

class CurvedBottomNavigationBar extends StatelessWidget {
  const CurvedBottomNavigationBar({
    super.key,
    required this.currentIndex,
  });

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors =
        context.watch<ThemeProvider>().appTheme.colorScheme;

    return CurvedNavigationBar(
      backgroundColor: appColors.secondaryContainer,
      color: appColors.tertiaryContainer,
      buttonBackgroundColor: appColors.primaryContainer,
      items: <Widget>[
        CurvedBottomNavigationBarIcon(
          currentIndex: currentIndex,
          icon: Icons.add,
          idx: 0,
          label: 'Add',
        ),
        CurvedBottomNavigationBarIcon(
          currentIndex: currentIndex,
          icon: Icons.history,
          idx: 1,
          label: 'History',
        ),
        CurvedBottomNavigationBarIcon(
          currentIndex: currentIndex,
          icon: Icons.save,
          idx: 2,
          label: 'Saved',
        ),
      ],
      index: currentIndex,
      onTap: (int idx) {
        context
            .read<BottomNavigationBarProvider>()
            .link(idx, rootAppPaths, context);
      },
      animationDuration: const Duration(milliseconds: 300),
    );
  }
}

class CurvedBottomNavigationBarIcon extends StatelessWidget {
  const CurvedBottomNavigationBarIcon({
    super.key,
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
    final ColorScheme appColors =
        context.watch<ThemeProvider>().appTheme.colorScheme;

    if (currentIndex == idx) {
      return Icon(icon, size: 30, color: appColors.onPrimaryContainer);
    } else {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Gap(10),
          Icon(icon, size: 30, color: appColors.onPrimaryContainer),
          Text(style: TextStyle(color: appColors.onPrimaryContainer), label),
        ],
      );
    }
  }
}
