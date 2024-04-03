import 'dart:io';

import 'package:flutter/material.dart';

import 'collections/routes.dart';
import 'package:provider/provider.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';

import 'provider/theme_provider.dart';
import 'provider/bottom_navigation_bar_provider.dart';
import 'provider/add_page_word_display_provider.dart';
import 'provider/history_page_provider.dart';
import 'provider/saved_page_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid) {
    await FlutterDisplayMode.setHighRefreshRate();
  }
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ThemeProvider()),
    ChangeNotifierProvider(create: (_) => BottomNavigationBarProvider()),
    ChangeNotifierProvider(create: (_) => AddPageWordDisplayProvider()),
    ChangeNotifierProvider(create: (_) => HistoryPageProvider()),
    ChangeNotifierProvider(create: (_) => SavedPageProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Word App',
      theme: context.watch<ThemeProvider>().appTheme,
      routerConfig: router,
    );
  }
}
