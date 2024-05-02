import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:word_app/routes/layout-main/layout.dart';
import 'package:word_app/routes/layout-main/page.dart';
import 'package:word_app/routes/layout-main/history/page.dart';
import 'package:word_app/routes/layout-main/saves/page.dart';

import 'package:word_app/routes/layout-account/page.dart';
import 'package:word_app/routes/layout-account/signup/page.dart';

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
        return LayoutMain(
          slot: child,
        );
      },
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          pageBuilder: (BuildContext context, GoRouterState state) =>
              NoTransitionPage<void>(
            key: state.pageKey,
            child: const AddPage(),
          ),
        ),
        GoRoute(
          path: '/history',
          pageBuilder: (BuildContext context, GoRouterState state) =>
              NoTransitionPage<void>(
            key: state.pageKey,
            child: const HistoryPage(),
          ),
        ),
        GoRoute(
          path: '/saves',
          pageBuilder: (BuildContext context, GoRouterState state) =>
              NoTransitionPage<void>(
            key: state.pageKey,
            child: const SavesPage(),
          ),
        ),
      ],
    ),
    GoRoute(
      path: '/account',
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state) =>
          NoTransitionPage<void>(
        key: state.pageKey,
        child: const AccountPage(),
      ),
    ),
    GoRoute(
      path: '/signup',
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state) =>
          NoTransitionPage<void>(
        key: state.pageKey,
        child: const SignupPage(),
      ),
    ),
  ],
);
