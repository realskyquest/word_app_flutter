import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:word_app/routes/layout-main/layout.dart';
import 'package:word_app/routes/layout-main/page.dart';
import 'package:word_app/routes/layout-main/history/page.dart';
import 'package:word_app/routes/layout-main/saves/page.dart';

import 'package:word_app/routes/layout-account/page.dart';


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
        return LayoutMain(page: child);
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
      pageBuilder: (BuildContext context, GoRouterState state) =>
          CustomTransitionPage<void>(
              key: state.pageKey,
              child: const AccountPage(),
              transitionsBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                      Widget child) =>
                  SlideTransition(
                    position: animation.drive(
                      Tween<Offset>(
                        begin: const Offset(0.0, 1.0),
                        end: Offset.zero,
                      ).chain(
                        CurveTween(curve: Curves.ease),
                      ),
                    ),
                    child: child,
                  )),
    ),
  ],
);
