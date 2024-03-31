import 'dart:io';

import 'package:flutter/material.dart';
import 'package:word_app/themes/theme.dart';

import 'package:provider/provider.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';

import 'provider/bottom_navigation_bar_provider.dart';

import 'package:word_app/collections/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid) {
    await FlutterDisplayMode.setHighRefreshRate();
  }
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => BottomNavigationBarProvider())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Word App',
      theme: appTheme,
      routerConfig: router,
    );
  }
}
