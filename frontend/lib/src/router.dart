import 'package:flutter/material.dart';

import 'routes/about.dart';
import 'routes/index.dart';

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
              case IndexRoute.routeName:
                return const IndexRoute();
              case AboutRoute.routeName:
                return const AboutRoute();
              default:
                return const IndexRoute();
            }
          },
        );
      },
    );
  }
}
