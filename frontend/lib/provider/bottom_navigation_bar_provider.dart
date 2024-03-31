import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

//import 'package:flutter/material.dart';
//import 'package:go_router/go_router.dart';

class BottomNavigationBarProvider with ChangeNotifier, DiagnosticableTreeMixin {
  int _index = 0;

  get index => _index;

  void link(int index2, rootPaths, BuildContext context) {
    final invertedRouteMap =
        rootPaths.map((key, value) => MapEntry(value, key));

    // if (index2 == 0) {
    //   GoRouter.of(context).go(invertedRouteMap[index2]!);
    // } else {
    //   if (_index != index2) {
    //     GoRouter.of(context).push(invertedRouteMap[index2]!);
    //   }
    // }

    // Initial location
    if (_index == 0) {
      // Can't push initial page to initial location
      if (index2 != 0) {
        GoRouter.of(context).push(invertedRouteMap[index2]!);
      }
    } else {
      // We are not in the initial location AKA, we moved some other page already
      // Push to initial location and current location is not allowed
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
  String currentRouteString(rootPaths, context) {
    final invertedRouteMap =
        rootPaths.map((key, value) => MapEntry(value, key));
    final index2 = currentRouteIndex(rootPaths, context);

    return invertedRouteMap[index2]!;
  }

  // Checks the router for current route and updates the _index and returns the index
  int currentRouteIndex(rootPaths, BuildContext context) {
    final invertedRouteMap =
        rootPaths.map((key, value) => MapEntry(value, key));
    final String location = GoRouterState.of(context).uri.toString();

    if (invertedRouteMap.values.contains(location)) {
      _index = rootPaths[location]!;
    }

    return _index;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('index', index));
  }
}
