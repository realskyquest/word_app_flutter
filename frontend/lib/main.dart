import 'dart:io';
import 'package:flutter/material.dart';

import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive_flutter/adapters.dart';

import 'utils/logger.dart';
import 'utils/router.dart';
import 'models/saves.dart';

import 'package:provider/provider.dart';
import 'provider/pocketbase_provider.dart';
import 'provider/theme_provider.dart';
import 'provider/bottom_navigation_bar_provider.dart';
import 'provider/add_provider.dart';
import 'provider/history_provider.dart';
import 'provider/saves_provider.dart';
import 'provider/account_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid) {
    await FlutterDisplayMode.setHighRefreshRate();

    final Directory directory = await getApplicationDocumentsDirectory();
    final String hivePath = directory.path;
    await Hive.initFlutter('$hivePath/hive');
    Hive.registerAdapter(SavesModelAdapter());

    var box1 = await Hive.openBox('theme');
    bool mode = await box1.get('mode', defaultValue: false);
    initialAppDarkMode = mode;

    var box2 = await Hive.openBox('saves');
    List<dynamic> saves = await box2.get('list', defaultValue: []);
    initialSaves = saves.cast<SavesModel>();

    initialServerIsRunning = false;
    // if (await isServerRunningUtil() == true) {
    //   initialServerIsRunning = true;
    //   initialPb = PocketBase('');
    // } else {
    //   initialServerIsRunning = false;
    // }

    logger.t(
      [
        'Main is running',
        {
          'display_mode': await FlutterDisplayMode.active,
          'hive_path': '$hivePath/hive',
          'is_server_running': initialServerIsRunning,
          'saved_theme': initialAppDarkMode == true ? 'dark' : 'light',
        },
      ],
    );
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PocketbaseProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(
            create: (context) => BottomNavigationBarProvider()),
        ChangeNotifierProvider(create: (context) => AddProvider()),
        ChangeNotifierProvider(create: (context) => HistoryProvider()),
        ChangeNotifierProvider(create: (context) => SavesProvider()),
        ChangeNotifierProvider(create: (context) => AccountProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    logger.t('MyApp Class');

    return Consumer<ThemeProvider>(
      builder:
          (BuildContext context, ThemeProvider themeProvider, Widget? child) {
        logger.i('MyApp Consumer');

        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Word App',
          theme: appLightTheme,
          darkTheme: appDarkTheme,
          themeMode:
              themeProvider.appDarkMode ? ThemeMode.dark : ThemeMode.light,
          routerConfig: router,
        );
      },
    );
  }
}
