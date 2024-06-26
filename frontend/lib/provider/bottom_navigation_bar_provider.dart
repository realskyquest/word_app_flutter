import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class BottomNavigationBarProvider with ChangeNotifier, DiagnosticableTreeMixin {
  int _index = 0;

  int get index => _index;

  void link(int index2, Map<String, int> paths, BuildContext context) {
    final invertedRouteMap =
        paths.map((key, value) => MapEntry(value, key));
    
    // Initial location
    if (_index == 0) {
      // Can't push initial page to initial location
      if (index2 != 0) {
        GoRouter.of(context).push(invertedRouteMap[index2]!);
      }
    } else {
      // We are not in the initial location AKA, we moved some other page already
      /*
        When index2 is 0, go is used,
        if not, replace is used 
      */
      if (index2 == 0) {
        GoRouter.of(context).go(invertedRouteMap[index2]!);
      } else {
        GoRouter.of(context).replace(invertedRouteMap[index2]!);
      }
    }

    _index = index2;
    notifyListeners();
  }

  // Uses the currentRouteIndex and returns the current route as a string
  String currentRouteString(paths, context) {
    final invertedRouteMap =
        paths.map((key, value) => MapEntry(value, key));
    final index2 = currentRouteIndex(paths, context);

    return invertedRouteMap[index2]!;
  }

  // Checks the router for current route and updates the _index and returns the index
  int currentRouteIndex(paths, BuildContext context) {
    final invertedRouteMap =
        paths.map((key, value) => MapEntry(value, key));
    final String location = GoRouterState.of(context).uri.toString();

    if (invertedRouteMap.values.contains(location)) {
      _index = paths[location]!;
    }

    return _index;
  }

  // Take care of later
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('index', index));
  }
}
