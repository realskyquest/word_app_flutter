import 'dart:io';
import 'package:flutter/material.dart';

import 'collections/routes.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:provider/provider.dart';

import 'provider/theme_provider.dart';
import 'provider/bottom_navigation_bar_provider.dart';
import 'provider/add_screen_provider.dart';
import 'provider/history_screen_provider.dart';
import 'provider/saved_screen_provider.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid) {
    await FlutterDisplayMode.setHighRefreshRate();
  }
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ThemeProvider()),
    ChangeNotifierProvider(create: (_) => BottomNavigationBarProvider()),
    ChangeNotifierProvider(create: (_) => AddScreenProvider()),
    ChangeNotifierProvider(create: (_) => HistoryScreenProvider()),
    ChangeNotifierProvider(create: (_) => SavedScreenProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData appTheme = context.watch<ThemeProvider>().appTheme;

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Word App',
      theme: appTheme,
      routerConfig: router,
    );
  }
}
