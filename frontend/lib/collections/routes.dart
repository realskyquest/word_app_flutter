import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:word_app/pages/root/root_app.dart';

import 'package:word_app/pages/add_screen.dart';
import 'package:word_app/pages/history_screen.dart';
import 'package:word_app/pages/saved_screen.dart';
import 'package:word_app/pages/account/account.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: <RouteBase>[
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return RootApp(child: child);
      },
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          pageBuilder: (BuildContext context, GoRouterState state) =>
              NoTransitionPage<void>(
            key: state.pageKey,
            child: const AddScreen(),
          ),
        ),
        GoRoute(
          path: '/history',
          pageBuilder: (BuildContext context, GoRouterState state) =>
              NoTransitionPage<void>(
            key: state.pageKey,
            child: const HistoryScreen(),
          ),
        ),
        GoRoute(
          path: '/saved',
          pageBuilder: (BuildContext context, GoRouterState state) =>
              NoTransitionPage<void>(
            key: state.pageKey,
            child: const SavedScreen(),
          ),
        ),
      ],
    ),
    GoRoute(
      path: '/account',
      pageBuilder: (BuildContext context, GoRouterState state) =>
          NoTransitionPage<void>(
        key: state.pageKey,
        child: const AccountPage(),
      ),
      
    ),
  ],
);
