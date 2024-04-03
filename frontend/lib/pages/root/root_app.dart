import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:provider/provider.dart';
import 'package:word_app/provider/theme_provider.dart';
import 'package:word_app/provider/bottom_navigation_bar_provider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

const _rootPaths = {
  "/": 0,
  "/history": 1,
  "/saved": 2,
  "/account": 3,
};

class RootApp extends StatelessWidget {
  const RootApp({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context
            .watch<ThemeProvider>()
            .appTheme
            .colorScheme
            .primaryContainer,
        title: const Text('Word App'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              GoRouter.of(context).push('/account');
            },
            icon: const Icon(Icons.account_box),
          ),
          IconButton(
            onPressed: () {
              if (context.read<ThemeProvider>().appDarkMode == true) {
                context.read<ThemeProvider>().changeTheme(false);
              } else {
                context.read<ThemeProvider>().changeTheme(true);
              }
            },
            icon: const ThemeIcon(),
          ),
        ],
      ),
      body: child,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: context
                .watch<ThemeProvider>()
                .appTheme
                .colorScheme
                .onPrimaryContainer,
            height: 20,
          ),
          const CurvedBottomNavigationBar(),
        ],
      ),
    );
  }
}

class ThemeIcon extends StatelessWidget {
  const ThemeIcon({super.key});

  @override
  Widget build(BuildContext context) {
    if (context.watch<ThemeProvider>().appDarkMode == true) {
      return const Icon(Icons.wb_sunny);
    } else {
      return const Icon(Icons.mode_night);
    }
  }
}

class CurvedBottomNavigationBar extends StatelessWidget {
  const CurvedBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: context
          .watch<ThemeProvider>()
          .appTheme
          .colorScheme
          .onPrimaryContainer,
      color:
          context.watch<ThemeProvider>().appTheme.colorScheme.primaryContainer,
      buttonBackgroundColor:
          context.watch<ThemeProvider>().appTheme.colorScheme.onPrimary,
      items: const <Widget>[
        CurvedBottomNavigationBarIcon(
          icon: Icon(Icons.add, size: 30),
          idx: 0,
          label: 'Add',
        ),
        CurvedBottomNavigationBarIcon(
          icon: Icon(Icons.history, size: 30),
          idx: 1,
          label: 'History',
        ),
        CurvedBottomNavigationBarIcon(
          icon: Icon(Icons.save, size: 30),
          idx: 2,
          label: 'Saved',
        ),
      ],
      index: context
          .watch<BottomNavigationBarProvider>()
          .currentRouteIndex(_rootPaths, context),
      onTap: (int idx) {
        context
            .read<BottomNavigationBarProvider>()
            .link(idx, _rootPaths, context);
      },
    );
  }
}

class CurvedBottomNavigationBarIcon extends StatelessWidget {
  final int idx;
  final Widget icon;
  final String label;

  const CurvedBottomNavigationBarIcon(
      {super.key, required this.icon, required this.label, required this.idx});

  @override
  Widget build(BuildContext context) {
    if (context
            .watch<BottomNavigationBarProvider>()
            .currentRouteIndex(_rootPaths, context) ==
        idx) {
      return icon;
    } else {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          Text(label),
        ],
      );
    }
  }
}
