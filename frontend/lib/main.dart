import 'dart:io';
import 'package:flutter/material.dart';

import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:hive_flutter/adapters.dart';

import 'collections/routes.dart';
import 'package:word_app/models/saves.dart';

import 'package:provider/provider.dart';
import 'provider/theme_provider.dart';
import 'provider/bottom_navigation_bar_provider.dart';
import 'provider/add_screen_provider.dart';
import 'provider/history_screen_provider.dart';
import 'provider/saved_screen_provider.dart';

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

    // final pb = PocketBase('http://10.0.2.2:8090/');

    // final body = <String, dynamic>{
    //   "username": "Bob",
    //   "email": "bob@example.com",
    //   "password": "12345678",
    //   "passwordConfirm": "12345678",
    //   "name": "Bob Smith"
    // };

    // final record = await pb.collection('users').create(body: body);
    // print(record);
  }
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => BottomNavigationBarProvider()),
        ChangeNotifierProvider(create: (_) => AddScreenProvider()),
        ChangeNotifierProvider(create: (_) => HistoryScreenProvider()),
        ChangeNotifierProvider(create: (_) => SavedScreenProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Word App',
      theme: appLightTheme,
      darkTheme: appDarkTheme,
      themeMode: context.watch<ThemeProvider>().appDarkMode
          ? ThemeMode.dark
          : ThemeMode.light,
      routerConfig: router,
    );
  }
}
