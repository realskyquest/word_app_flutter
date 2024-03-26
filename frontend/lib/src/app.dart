import 'package:flutter/material.dart';

// Pages
import 'pages/main.dart';
import 'pages/about.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      restorationScopeId: 'app',
      title: 'Word App',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.deepOrange),
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) {
            switch (routeSettings.name) {
              case MainPage.pageName:
                return const MainPage();
              case AboutPage.pageName:
                return const AboutPage();
              default:
                return const MainPage();
            }
          },
        );
      },
    );
  }
}