import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:word_app/store.dart';

import 'src/router.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => IndexRouteBottomNavigationBarState()),
      ChangeNotifierProvider(create: (_) => IndexRouteCount()),
      ChangeNotifierProvider(create: (_) => AboutPageCount()),
    ],
    child: const MyApp(),
  ));
}
